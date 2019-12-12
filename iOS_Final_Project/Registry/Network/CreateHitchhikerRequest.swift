//
//  CreateHitchhikerRequest.swift
//  iOS_Final_Project
//
//  Created by Muharrem Salel on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct CreateHitchhikerRequest: Codable {
    let username: String
    let password: String
    let firstName: String
    let surname: String
    let driver: Bool
    let email: String
    let phone: String
    let age: Int
    let sex: String
}
