//
//  NewDriverAccountViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 3.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension NewDriverAccountViewController: NewDriverDataSourceDelegate {
    func goToHome() {
        performSegue(withIdentifier: "toDriverHome", sender: nil)
    }
    
    func showAlertMsg(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

extension NewDriverAccountViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = newDriverAccountHelper.genderPickerData[row]
    }
}

extension NewDriverAccountViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newDriverAccountHelper.genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return newDriverAccountHelper.genderPickerData[row]
    }
}

class NewDriverAccountViewController: BaseScrollViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var plaqueTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    var newDriverAccountHelper = NewDriverAccountHelper()
    var newDriverDataSource = NewDriverDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Driver Account"
        // Do any additional setup after loading the view.
        
        // Choose Profile Image
        profileImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        profileImageView.addGestureRecognizer(gestureRecognizer)
        
        newDriverDataSource.delegate=self
        // Set TextField Delegates
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        ageTextField.delegate = self
        carModelTextField.delegate = self
        plaqueTextField.delegate = self
        
        passwordTextField.isSecureTextEntry = true
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
        
        newDriverAccountHelper.genderPicker.delegate = self
        newDriverAccountHelper.genderPicker.dataSource = self
        genderTextField.text = newDriverAccountHelper.genderPickerData.first
        genderTextField.inputView = newDriverAccountHelper.genderPicker
    }
    
    @objc func choosePicture() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let name = nameTextField.text, !name.isEmpty,
            let surname = surnameTextField.text, !surname.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let phone = phoneNumberTextField.text, !phone.isEmpty,
            let age = ageTextField.text, !age.isEmpty,
            let gender = genderTextField.text, !gender.isEmpty,
            let carModel = carModelTextField.text, !carModel.isEmpty,
            let plaque = plaqueTextField.text, !plaque.isEmpty else {
                showAlertMsg(title: "Missing Information", message: "Please fill all fields of the form")
                return
        }
        guard username.isAlphanumeric, password.isAlphanumeric else {
            showAlertMsg(title: "Invalid Username or Password", message: "Please use alphanumeric characters")
            return
        }
        guard name.isAlphabetic, surname.isAlphabetic else {
            showAlertMsg(title: "Invalid Name or Surname", message: "Please use alphabetic characters")
            return
        }
        guard email.isValidEmail else {
            showAlertMsg(title: "Invalid Email", message: "Please enter a valid email address")
            return
        }
        guard let userAge = Int(age) else {
            showAlertMsg(title: "Invalid Age", message: "Please enter your age as a number")
            return
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(true, forKey: "userLoggedIn")
        userDefaults.setValue(true, forKey: "userIsDriver")
        userDefaults.setValue(username, forKeyPath: "username")
        
        newDriverDataSource.addNewDriver(username: username, password: password, name: name, surname: surname, email: email,
                                            phonenumber: phone, age: userAge, carModel: carModel, plaque: plaque, gender: gender)
        // feed e yolla
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDriverHome" {
            let destinationVc = segue.destination as! DriverHomeViewController
            destinationVc.driverHomeDataSource.driver = newDriverDataSource.user
        }
    }

}

//MARK: - UITextFieldDelegate

extension NewDriverAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        // self.view.endEditing(true)
        // return false
    }
    
    @objc
    func textFieldDidChange(textField: UITextField) {
        /*
        if model.isUsernameValid(username: username.text ?? "") && model.isPasswordValid(password: password.text ?? "") {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
        */
    }
}
