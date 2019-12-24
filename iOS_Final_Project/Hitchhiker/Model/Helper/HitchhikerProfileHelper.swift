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
        hitchhikerInfoArray = [(String, String)]()
        if let carModel = hitchhiker.carModel {
            hitchhikerInfoArray.append(("Car Model", carModel))
        }
        if let carPlaque = hitchhiker.plaque {
            hitchhikerInfoArray.append(("Car Plaque", carPlaque))
        }
        hitchhikerInfoArray.append(("Name", "\(hitchhiker.firstName) \(hitchhiker.surname)"))
        hitchhikerInfoArray.append(("Email", hitchhiker.email))
        hitchhikerInfoArray.append(("Phone Number", hitchhiker.phoneNumber))
        hitchhikerInfoArray.append(("Gender", hitchhiker.sex))
        hitchhikerInfoArray.append(("Age", "\(hitchhiker.age)"))
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
