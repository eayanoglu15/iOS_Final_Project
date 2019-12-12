//
//  DriverEditProfileViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

class DriverEditProfileViewController: BaseScrollViewController {
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
        
        driverEditProfileHelper.genderPicker.delegate = self
        driverEditProfileHelper.genderPicker.dataSource = self
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
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
