//
//  HitchhikerOtherProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerOtherProfileHelper {
    var otherUsername: String?
    var otherUser: User?
    var otherUserInfoArray = [(String, String)]()
    
    func getInfoArray() {
        if let username = otherUsername {
            otherUserInfoArray.append(("Username", username))
        }
        if let name = otherUser?.firstName,
            let surname = otherUser?.surname {
            otherUserInfoArray.append(("Name", "\(name) \(surname)"))
        }
        if let email = otherUser?.email {
            otherUserInfoArray.append(("Email", email))
        }
        if let phone = otherUser?.phoneNumber {
            otherUserInfoArray.append(("Phone Number", phone))
        }
        if let age = otherUser?.age {
            otherUserInfoArray.append(("Age", "\(age)"))
        }
    }
}
