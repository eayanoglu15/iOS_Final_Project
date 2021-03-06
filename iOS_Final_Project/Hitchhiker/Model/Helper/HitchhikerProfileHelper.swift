//
//  HitchhikerProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerProfileHelper {
    var hitchhikerInfoArray = [(String, String)]()
    
    func getInfoArray(hitchhiker: User) {
        let name = hitchhiker.firstName
        let surname = hitchhiker.surname
        hitchhikerInfoArray.append(("Name", "\(name) \(surname)"))
        
        let email = hitchhiker.email
        hitchhikerInfoArray.append(("Email", email))
        
        let phone = hitchhiker.phoneNumber
        hitchhikerInfoArray.append(("Phone Number", phone))
        
        let age = hitchhiker.age
        hitchhikerInfoArray.append(("Age", "\(age)"))
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
