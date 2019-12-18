//
//  DriverUpdateRequest.swift
//  iOS_Final_Project
//
//  Created by Muharrem Salel on 17.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct DriverUpdateRequest : Codable {
    let id:Int
    let username: String
    let password: String
    let name: String
    let surname: String
    let email: String
    let phonenumber: String
    let age: Int
    let gender: String
    let isDriver: Bool
    let carModel: String
    let plaque: String
}
