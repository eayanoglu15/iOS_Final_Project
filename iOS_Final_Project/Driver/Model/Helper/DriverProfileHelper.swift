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
    
    private enum Constant {
        static let starNum = 5
        static let filledStarName = "star.fill"
        static let halfFilledStarName = "star.lefthalf.fill"
        static let emptyStarName = "star"
    }
    
    func getRatingImageArray(rating: Double) -> [String] {
        var ratingImageArray = [String]()
        let numberOfFilledStars = Int(rating)
        if rating >= 1 {
            for _ in 1...numberOfFilledStars {
                ratingImageArray.append(Constant.filledStarName)
            }
        }
        if rating - Double(numberOfFilledStars) >= 0.5 {
            ratingImageArray.append(Constant.halfFilledStarName)
        }
        let remaining = Constant.starNum - ratingImageArray.count
        for _ in 1...remaining {
            ratingImageArray.append(Constant.emptyStarName)
        }
        return ratingImageArray
    }
}
