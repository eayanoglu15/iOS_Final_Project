//
//  HitchhikerEditProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerEditProfileViewController: HitchhikerEditProfileDataSourceDelegate {
    func goToProfile() {
        self.removeSpinner()
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

class HitchhikerEditProfileViewController: BaseScrollViewController, UITextFieldDelegate {
    var hitchhikerEditProfileHelper = HitchhikerEditProfileHelper()
    var hitchhikerEditProfileDataSource = HitchhikerEditProfileDataSource()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        hitchhikerEditProfileDataSource.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        ageTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
        hitchhikerEditProfileHelper.genderPicker.delegate = self
        hitchhikerEditProfileHelper.genderPicker.dataSource = self
        genderTextField.inputView = hitchhikerEditProfileHelper.genderPicker
        if let user = hitchhikerEditProfileDataSource.hitchhiker {
            showUserInfo(user: user)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.showSpinner()
        guard let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let name = nameTextField.text, !name.isEmpty,
            let surname = surnameTextField.text, !surname.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let phone = phoneNumberTextField.text, !phone.isEmpty,
            let ageText = ageTextField.text, !ageText.isEmpty else {
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
        guard let age = Int(ageText) else {
            showAlert(title: "Invalid Age", message: "Please enter your age as a number")
            return
        }
        guard let gender = genderTextField.text else {
            showAlert(title: "Invalid Gender", message: "Please enter a gender")
            return
        }
        var id = 0
        if let hitchhiker = hitchhikerEditProfileDataSource.hitchhiker {
            id = hitchhiker.id
        }
        print("id: ", id)
        hitchhikerEditProfileDataSource.updateHitchihiker(id: id, username: username, password: password, name: name, surname: surname, email: email,
                                                          phonenumber: phone, age: age, gender: gender)
    }
    
    func showUserInfo(user: User) {
        usernameTextField.text = user.username
        passwordTextField.text = user.password
        nameTextField.text = user.firstName
        surnameTextField.text = user.surname
        emailTextField.text = user.email
        phoneNumberTextField.text = user.phoneNumber
        ageTextField.text = String(user.age)
        genderTextField.text = user.sex
    }
}

extension HitchhikerEditProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hitchhikerEditProfileHelper.genderPickerData.count
    }
}

extension HitchhikerEditProfileViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return hitchhikerEditProfileHelper.genderPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        genderTextField.text = hitchhikerEditProfileHelper.genderPickerData[row]
        self.view.endEditing(false)
    }
}
