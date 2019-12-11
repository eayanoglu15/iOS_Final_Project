//
//  NewDriverDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class NewDriverDataSource {
    var user: User?

    func addNewDriver(username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int, carModel: String, plaque: String, gender: String) {
        user = User(isDriver: true, username: username, password: password,
        name: name, surname: surname, email: email,
        phonenumber: phonenumber, age: age, sex: gender, carModel: carModel, plaque: plaque)
    }
}
