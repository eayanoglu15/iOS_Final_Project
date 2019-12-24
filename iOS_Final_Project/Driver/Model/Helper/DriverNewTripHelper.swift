//
//  DriverNewTripHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

enum DateFormat {
    static let network: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let display: String = "HH:mm\tdd/MM/yy"
    static let networkUTC: String = "yyyy-MM-dd'T'HH:mm:ssZ"
}

class DriverNewTripHelper {
    var startTimePicker = UIDatePicker()
    var endTimePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    var minSeat = "1"
    var currentTime: String = ""
    var startTime = ""
    var endTime = ""
    
    func setDateFormat(type: String) {
        dateFormatter.dateFormat = type
    }
    
    func setDefaultValues() {
        startTimePicker.datePickerMode = .time
        endTimePicker.datePickerMode = .time
        let minimumDate = Date()
        setDateFormat(type: DateFormat.display)
        setDatePicker(datePicker: startTimePicker, minDate: minimumDate)
        setDatePicker(datePicker: endTimePicker, minDate: minimumDate)
        currentTime = dateFormatter.string(from: minimumDate)
        startTime = currentTime
        endTime = currentTime
    }
    
    func setDatePicker(datePicker: UIDatePicker, minDate: Date) {
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = minDate
    }
    
    func upgradeEndDatePickersForMinimumDate() {
        setDateFormat(type: DateFormat.display)
        setDatePicker(datePicker: endTimePicker, minDate: startTimePicker.date)
    }
    
    func saveStartTime() -> String {
        setDateFormat(type: DateFormat.display)
        let startText = dateFormatter.string(from: startTimePicker.date)
        startTime = startText
        endTime = startText
        upgradeEndDatePickersForMinimumDate()
        return startText
    }
    
    func saveEndTime() -> String {
        setDateFormat(type: DateFormat.display)
        let endText = dateFormatter.string(from: endTimePicker.date)
        endTime = endText
        return endText
    }
}
