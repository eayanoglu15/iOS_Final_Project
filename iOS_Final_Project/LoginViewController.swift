//
//  LoginViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 2.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension LoginViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class LoginViewController: BaseScrollViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func handleKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = UIEdgeInsets.zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
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
