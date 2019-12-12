//
//  DriverNewTripHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

class DriverNewTripHelper {
    
    /* Maybe Helpful for Backend */
    /*
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let localDate = formatter.dateFromString(date)
    */
    
    enum DateFormat {
        static let network = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        static let display = "MM dd, HH:mm"
    }
    
    var startTimePicker = UIDatePicker()
    var endTimePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    
    var startDate: String = ""
    var endDate: String = ""
    
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
        startDate = dateFormatter.string(from: Date())
        endDate = dateFormatter.string(from: Date())
    }
    
    func setDatePicker(datePicker: UIDatePicker, minDate: Date) {
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = minDate
    }
    
    func saveSelectedDates(start: String?, end: String?) {
        setDateFormat(type: DateFormat.display)
        if let selectedStartDate = start {
            let selectedDate = dateFormatter.date(from: selectedStartDate)
            setDateFormat(type: DateFormat.network)
            if let date = selectedDate {
                startDate = dateFormatter.string(from: date)
            }
        }
        
        setDateFormat(type: DateFormat.display)
        if let selectedEndDate = end {
            let selectedDate = dateFormatter.date(from: selectedEndDate)
            setDateFormat(type: DateFormat.network)
            if let date = selectedDate {
                endDate = dateFormatter.string(from: date)
            }
        }
    }
    
    func upgradeEndDatePickersForMinimumDate() {
        setDateFormat(type: DateFormat.display)
        setDatePicker(datePicker: endTimePicker, minDate: startTimePicker.date)
    }
    
    
}
