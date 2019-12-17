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
        let name = user.firstName
        let surname = user.surname
        otherUserInfoArray.append(("Name", "\(name) \(surname)"))
        
        let email = user.email
        otherUserInfoArray.append(("Email", email))
        
        let phone = user.phoneNumber
        otherUserInfoArray.append(("Phone Number", phone))
        
        let age = user.age
        otherUserInfoArray.append(("Age", "\(age)"))
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
