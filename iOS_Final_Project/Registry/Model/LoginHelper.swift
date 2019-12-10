//
//  LoginHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 4.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class LoginHelper {
    
    private enum Count {
        static let password = 6
        static let userNameMax = 12
        static let userNameMin = 3
    }
    
    var user: User?
    
    func isUsernameValid(username: String) -> Bool {
        if Count.userNameMin...Count.userNameMax ~= username.count {
            return username.isAlphanumeric
        }
        return false
    }
    
    func isPasswordValid(password: String) -> Bool {
        return password.count == Count.password ? password.isNumeric : false
    }
}
