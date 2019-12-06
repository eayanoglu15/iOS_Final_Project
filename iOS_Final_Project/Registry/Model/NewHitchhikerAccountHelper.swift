//
//  NewHitchhikerAccountHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 4.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

/*
protocol NewHitchhikerAccountHelperDelegate {
    func showInvalidInfoAlert()
}
 */

class NewHitchhikerAccountHelper {
    /*
    private enum Count {
        static let password = 6
        static let userNameMax = 12
        static let userNameMin = 3
    }
    */

    var user: User?
    var isFormFilled = false
    
    func addNewHitchihiker(username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int) {
        user = User(isDriver: false, username: username, password: password,
                    name: name, surname: surname, email: email,
                    phonenumber: phonenumber, age: age, sex: "")
    }
}
