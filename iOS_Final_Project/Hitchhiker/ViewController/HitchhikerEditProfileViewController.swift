//
//  HitchhikerEditProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension HitchhikerEditProfileViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        hitchhikerEditProfileHelper.selectedGender = hitchhikerEditProfileHelper.genderPickerData[row]
    }
}

extension HitchhikerEditProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hitchhikerEditProfileHelper.genderPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hitchhikerEditProfileHelper.genderPickerData[row]
    }
}

class HitchhikerEditProfileViewController: UIViewController {
    var hitchhikerEditProfileHelper = HitchhikerEditProfileHelper()
    var hitchhikerEditProfileDataSource = HitchhikerEditProfileDataSource()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var genderPickerView: UIPickerView!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        title = "Edit Profile"
        // Do any additional setup after loading the view.
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
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        if segue.identifier == "toProfileFromEdit" {
            let destinationVc = segue.destination as! HitchhikerProfileViewController
            destinationVc.hitchhikerProfileHelper.hitchhiker = hitchhikerEditProfileHelper.hitchhiker
        }
         */
    }

}

//MARK: - UITextFieldDelegate

extension HitchhikerEditProfileViewController: UITextFieldDelegate {
    
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
