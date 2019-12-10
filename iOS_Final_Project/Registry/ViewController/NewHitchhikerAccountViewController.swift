//
//  NewHitchhikerAccountViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 3.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

class NewHitchhikerAccountViewController: BaseScrollViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    let newHitchhikerAccountHelper = NewHitchhikerAccountHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Hitchhiker Account"
        
        // Choose Picture
        profileImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        profileImageView.addGestureRecognizer(gestureRecognizer)
        
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
        ageTextField.keyboardType = .decimalPad
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
        print(username)
        // guard let ile username - password check ekle ve message ver
        guard let userAge = Int(age) else {
            showAlert(title: "Invalid Age", message: "Please enter your age as a number")
            
            return
        }
        newHitchhikerAccountHelper.addNewHitchihiker(username: username, password: password, name: name, surname: surname, email: email,
        phonenumber: phone, age: userAge)
        performSegue(withIdentifier: "toHitchhikerHome", sender: nil)
        // feed e yolla
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == "toHitchhikerHome" {
            let destinationVc = segue.destination as! HitchhikerHomeViewController
            destinationVc.hitchhiker = newHitchhikerAccountHelper.user
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
