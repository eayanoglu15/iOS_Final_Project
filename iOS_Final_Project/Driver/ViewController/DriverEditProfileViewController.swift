//
//  DriverEditProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverEditProfileViewController: DriverEditProfileDataSourceDelegate {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}
class DriverEditProfileViewController: BaseScrollViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carPlaqueTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    var driverEditProfileDataSource = DriverEditProfileDataSource()
    var driverEditProfileHelper = DriverEditProfileHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        ageTextField.delegate = self
        carModelTextField.delegate = self
        carPlaqueTextField.delegate = self
        driverEditProfileDataSource.delegate = self
        passwordTextField.isSecureTextEntry = true
        ageTextField.keyboardType = .numberPad
        phoneNumberTextField.keyboardType = .phonePad
        
        driverEditProfileHelper.genderPicker.delegate = self
        driverEditProfileHelper.genderPicker.dataSource = self
        genderTextField.inputView = driverEditProfileHelper.genderPicker
        if let user = driverEditProfileDataSource.driver {
                   showUserInfo(user: user)
               }
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
           carModelTextField.text=user.carModel
          carPlaqueTextField.text=user.plaque
       }
       
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
                   let password = passwordTextField.text, !password.isEmpty,
                   let name = nameTextField.text, !name.isEmpty,
                   let surname = surnameTextField.text, !surname.isEmpty,
                   let email = emailTextField.text, !email.isEmpty,
                   let phone = phoneNumberTextField.text, !phone.isEmpty,
                   let plaque = carPlaqueTextField.text, !plaque.isEmpty,
                   let carModel = carModelTextField.text, !carModel.isEmpty,
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
        if let driver = driverEditProfileDataSource.driver {
         id = driver.id
        }
            driverEditProfileDataSource.updateDriver(id: id, username: username, password: password, name: name, surname: surname, email: email,
                                                 phonenumber: phone, age: age, gender: gender,carModel:carModel,plaque:plaque)
            
            
          
               
               let userDefaults = UserDefaults.standard
               userDefaults.setValue(username, forKeyPath: "username")
               
               self.navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DriverEditProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return driverEditProfileHelper.genderPickerData.count
    }
}

extension DriverEditProfileViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
     titleForRow row: Int,
     forComponent component: Int) -> String? {
        return driverEditProfileHelper.genderPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int) {
        genderTextField.text = driverEditProfileHelper.genderPickerData[row]
        self.view.endEditing(false)
    }
}
