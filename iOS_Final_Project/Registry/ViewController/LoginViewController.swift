//
//  LoginViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 2.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension LoginViewController: LoginDataSourceDelegate {
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func routeToHome(isDriver: Bool) {
        self.removeSpinner()
        if isDriver {
            performSegue(withIdentifier: "toDriverHomeFromLogin", sender: nil)
        } else {
            performSegue(withIdentifier: "toHitchhikerHomeFromLogin", sender: nil)
        }
    }
}

class LoginViewController: BaseScrollViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginHelper = LoginHelper()
    var loginDataSource = LoginDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        title = "Welcome"
        passwordTextField.isSecureTextEntry = true
        loginDataSource.delegate = self
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let username = usernameTextField.text,
            let password = passwordTextField.text {
            self.showSpinner()
            loginDataSource.loginUser(username: username, password: password)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHitchhikerHomeFromLogin" {
            let destinationVc = segue.destination as! HitchhikerHomeViewController
            destinationVc.hitchhikerHomeDataSource.hitchhiker = loginDataSource.user
        }
        if segue.identifier == "toDriverHomeFromLogin" {
            let destinationVc = segue.destination as! DriverHomeViewController
            destinationVc.driverHomeDataSource.driver = loginDataSource.user
            
        }
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
