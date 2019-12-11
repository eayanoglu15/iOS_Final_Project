//
//  LoginResponse.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let email: String
    let password: String
    let firstName: String
    let surname: String
    let username: String
    let phone: String
    let age: Int
    let point: Double           //
    let numberRevieved: Int     //
    let sex: String
    let driver: Bool
    var plaque: String?
    var carModel: String?
    let totalDistance: Double      //
    let id: Int                 //
    let version: String         //
}
