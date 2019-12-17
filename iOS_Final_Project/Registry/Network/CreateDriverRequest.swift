//
//  CreateDriverRequest.swift
//  iOS_Final_Project
//
//  Created by Muharrem Salel on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct CreateDriverRequest: Codable {
    let image:String
    let username: String
    let password: String
    let firstName: String
    let surname: String
    let driver: Bool
    let email: String
    let phone: String
    let age: Int
    let carModel: String
    let plaque: String
    let sex: String
}
