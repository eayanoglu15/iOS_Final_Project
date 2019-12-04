//
//  NewDriverAccountHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 4.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class NewDriverAccountHelper {
    var user: User?
    
    func addNewDriver(username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int, carModel: String, plaque: String) {
        user = User(isDriver: true, username: username, password: password,
        name: name, surname: surname, email: email,
        phonenumber: phonenumber, age: age, sex: "", carModel: carModel, plaque: plaque)
    }
}
