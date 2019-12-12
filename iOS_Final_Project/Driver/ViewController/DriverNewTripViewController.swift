//
//  NewTripViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

class DriverNewTripViewController: BaseScrollViewController {
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var availableSeatsTextField: UITextField!
    
    var driverNewTripDataSource = DriverNewTripDataSource()
    var driverNewTripHelper = DriverNewTripHelper()
    
    var fromPicker = UIPickerView()
    var toPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Trip"
        // Do any additional setup after loading the view.
        fromPicker.delegate = self
        fromPicker.dataSource = self
        
        toPicker.delegate = self
        toPicker.dataSource = self
        
        fromTextField.inputView = fromPicker
        toTextField.inputView = toPicker
        
        driverNewTripHelper.setDefaultValues()
        showStartTimePicker()
        showEndTimePicker()
        
        availableSeatsTextField.keyboardType = .numberPad
        
    }
    
    func showStartTimePicker() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveStartTimePicker));
        closeButton.tintColor = .purple
        saveButton.tintColor = .purple
        toolbar.setItems([closeButton,spaceButton,saveButton], animated: false)
        startTimeTextField.inputAccessoryView = toolbar
        startTimeTextField.inputView = driverNewTripHelper.startTimePicker
    }
    
    func showEndTimePicker() {
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveEndTimePicker));
        closeButton.tintColor = .purple
        saveButton.tintColor = .purple
        toolbar.setItems([closeButton,spaceButton,saveButton], animated: false)
        endTimeTextField.inputAccessoryView = toolbar
        endTimeTextField.inputView = driverNewTripHelper.endTimePicker
    }
    
    @objc func closeDatePicker() {
        view.endEditing(true)
    }
    
    @objc func saveStartTimePicker(){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: driverNewTripHelper.startTimePicker.date)
        startTimeTextField.text = strDate
        
        view.endEditing(true)
    }
    
    @objc func saveEndTimePicker(){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: driverNewTripHelper.endTimePicker.date)
        endTimeTextField.text = strDate
        self.view.endEditing(true)
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

extension DriverNewTripViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == fromPicker {
            return driverNewTripDataSource.fromArray.count
        }
        if pickerView == toPicker {
            return driverNewTripDataSource.toArray.count
        }
        return 0
    }
}

extension DriverNewTripViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
     titleForRow row: Int,
     forComponent component: Int) -> String? {
        if pickerView == fromPicker {
            return driverNewTripDataSource.fromArray[row]
        }
        if pickerView == toPicker {
            return driverNewTripDataSource.toArray[row]
        }
        return "error"
    }
    
    func pickerView(_ pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int) {
        if pickerView == fromPicker {
            fromTextField.text = driverNewTripDataSource.fromArray[row]
        }
        if pickerView == toPicker {
            toTextField.text = driverNewTripDataSource.toArray[row]
        }
        self.view.endEditing(false)
    }
}
