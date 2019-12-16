//
//  DriverHomeHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class DriverHomeHelper {
    var selectedUsername: String?
    
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
