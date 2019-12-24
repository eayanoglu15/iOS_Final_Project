//
//  DriverOtherProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class DriverOtherProfileHelper {
    var otherUserInfoArray = [(String, String)]()
    
    func getInfoArray(user: User) {
        otherUserInfoArray = [(String, String)]()
        if let carModel = user.carModel {
            otherUserInfoArray.append(("Car Model", carModel))
        }
        if let carPlaque = user.plaque {
            otherUserInfoArray.append(("Car Plaque", carPlaque))
        }
        otherUserInfoArray.append(("Name", "\(user.firstName) \(user.surname)"))
        otherUserInfoArray.append(("Email", user.email))
        otherUserInfoArray.append(("Phone Number", user.phoneNumber))
        otherUserInfoArray.append(("Gender", user.sex))
        otherUserInfoArray.append(("Age", "\(user.age)"))
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
