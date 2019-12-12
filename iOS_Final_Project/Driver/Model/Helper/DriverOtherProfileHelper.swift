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
}
