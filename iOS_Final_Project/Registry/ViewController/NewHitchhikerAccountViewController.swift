//
//  NewHitchhikerAccountViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 3.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension NewHitchhikerAccountViewController: NewHitchhikerDataSourceDelegate {
    func showAlert(title:String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}

extension NewHitchhikerAccountViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newHitchhikerAccountHelper.selectedGender = newHitchhikerAccountHelper.genderPickerData[row]
    }
}

extension NewHitchhikerAccountViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newHitchhikerAccountHelper.genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return newHitchhikerAccountHelper.genderPickerData[row]
    }
}

class NewHitchhikerAccountViewController: BaseScrollViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var newHitchhikerAccountHelper = NewHitchhikerAccountHelper()
    var newHitchhikerDataSource = NewHitchhikerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Hitchhiker Account"
        
        // Choose Picture
        profileImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        profileImageView.addGestureRecognizer(gestureRecognizer)
        newHitchhikerDataSource.delegate=self
        
        // Assign Text Field Delegates
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        ageTextField.delegate = self
        
        //registerButton.isEnabled = false
        passwordTextField.isSecureTextEntry = true
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
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
            let age = ageTextField.text, !age.isEmpty else {
                showAlert(title: "Missing Information", message: "Please fill all fields of the form")
                return
        }
        guard username.isAlphanumeric, password.isAlphanumeric else {
            showAlert(title: "Invalid Username or Password", message: "Please use alphanumeric characters")
            return
        }
        guard name.isAlphabetic, surname.isAlphabetic else {
            showAlert(title: "Invalid Name or Surname", message: "Please use alphabetic characters")
            return
        }
        guard email.isValidEmail else {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address")
            return
        }
        guard let userAge = Int(age) else {
            showAlert(title: "Invalid Age", message: "Please enter your age as a number")
            return
        }
        let gender = newHitchhikerAccountHelper.selectedGender
            
        newHitchhikerDataSource.addNewHitchihiker(username: username, password: password, name: name, surname: surname, email: email,
                                                  phonenumber: phone, age: userAge, gender: gender)
        performSegue(withIdentifier: "toHitchhikerHome", sender: nil)
        // feed e yolla
    }
    
   
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == "toHitchhikerHome" {
            let destinationVc = segue.destination as! HitchhikerHomeViewController
            destinationVc.hitchhikerHomeDataSource.hitchhiker = newHitchhikerDataSource.user
        }
     }
    
    
}

//MARK: - UITextFieldDelegate

extension NewHitchhikerAccountViewController: UITextFieldDelegate {
    
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
