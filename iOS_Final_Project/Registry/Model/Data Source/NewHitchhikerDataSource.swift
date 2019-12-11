//
//  NewHitchhikerDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class NewHitchhikerDataSource {
    var user: User?
    var isFormFilled = false
    
    func addNewHitchihiker(username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int, gender: String) {
        user = User(isDriver: false, username: username, password: password,
                    name: name, surname: surname, email: email,
                    phonenumber: phonenumber, age: age, sex: gender)
    }
}
