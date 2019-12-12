//
//  DriverProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class DriverProfileHelper {
    var driverInfoArray = [(String, String)]()
    
    func getInfoArray(driver: User) {
        if let carModel = driver.carModel {
            driverInfoArray.append(("Car Model", carModel))
        }
        
        if let carPlaque = driver.plaque {
            driverInfoArray.append(("Car Plaque", carPlaque))
        }
        
        let name = driver.firstName
        let surname = driver.surname
        driverInfoArray.append(("Name", "\(name) \(surname)"))
        
        let email = driver.email
        driverInfoArray.append(("Email", email))
        
        let phone = driver.phoneNumber
        driverInfoArray.append(("Phone Number", phone))
        
        let age = driver.age
        driverInfoArray.append(("Age", "\(age)"))
    }
}
