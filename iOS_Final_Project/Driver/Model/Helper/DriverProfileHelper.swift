//
//  DriverProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class DriverProfileHelper {
    var userInfoArray = [(String, String)]()
    
    func getInfoArray(user: User) {
        userInfoArray = [(String, String)]()
        if let carModel = user.carModel {
            userInfoArray.append(("Car Model", carModel))
        }
        if let carPlaque = user.plaque {
            userInfoArray.append(("Car Plaque", carPlaque))
        }
        userInfoArray.append(("Name", "\(user.firstName) \(user.surname)"))
        userInfoArray.append(("Email", user.email))
        userInfoArray.append(("Phone Number", user.phoneNumber))
        userInfoArray.append(("Gender", user.sex))
        userInfoArray.append(("Age", "\(user.age)"))
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
        for _ in 0..<numberOfFilledStars {
            ratingImageArray.append(Constant.filledStarName)
        }
        if rating - Double(numberOfFilledStars) >= 0.5 {
            ratingImageArray.append(Constant.halfFilledStarName)
        }
        let remaining = Constant.starNum - ratingImageArray.count
        for _ in 0..<remaining {
            ratingImageArray.append(Constant.emptyStarName)
        }
        return ratingImageArray
    }
}
