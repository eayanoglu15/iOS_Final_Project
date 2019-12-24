//
//  NewTripViewController.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import UIKit

extension DriverNewTripViewController: DriverNewTripDataSourceDelegate {
    func showAlertMsg(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func returnToDriverHome() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setFromTo() {
        fromTextField.text = driverNewTripDataSource.fromArray.first
        toTextField.text = driverNewTripDataSource.toArray.last
        self.removeSpinner()
    }
}

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
        driverNewTripDataSource.delegate = self
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
        startTimeTextField.text = driverNewTripHelper.currentTime
        endTimeTextField.text = driverNewTripHelper.currentTime
        availableSeatsTextField.text = driverNewTripHelper.minSeat
        availableSeatsTextField.keyboardType = .numberPad
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showSpinner()
        driverNewTripDataSource.getFromTo()
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
        let startText = driverNewTripHelper.saveStartTime()
        startTimeTextField.text = startText
        endTimeTextField.text = startText
        view.endEditing(true)
    }
    
    @objc func saveEndTimePicker(){
        endTimeTextField.text = driverNewTripHelper.saveEndTime()
        self.view.endEditing(true)
    }
    
    @IBAction func postTripButtonTapped(_ sender: Any) {
        guard let from = fromTextField.text, !from.isEmpty,
            let to = toTextField.text, !to.isEmpty,
            let seats = availableSeatsTextField.text, !seats.isEmpty else {
                showAlertMsg(title: "Missing Information", message: "Please fill all fields of the form")
                return
        }
        guard let seatNum = Int(seats) else {
            showAlertMsg(title: "Invalid Seat Number", message: "Please enter number of available seats as a number")
            return
        }
        
        guard let start = driverNewTripHelper.startTime.localToUTC(),
            let end = driverNewTripHelper.endTime.localToUTC() else {
                showAlertMsg(title: "Invalid Time", message: "Select time")
                return
        }
        print("Start Time: ", start)
        print("End Time: ", end)
        let userDefaults = UserDefaults.standard
        if let username = userDefaults.string(forKey: "username") {
            driverNewTripDataSource.createTrip(from: from, to: to, startTime: start, endTime: end, seatNum: seatNum, driverUsername: username)
        }
    }
    
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
