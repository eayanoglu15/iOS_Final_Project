//
//  HitchhikerUpdateRequest.swift
//  iOS_Final_Project
//
//  Created by Muharrem Salel on 17.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct HitchhikerUpdateRequest : Codable {
    let email: String
    let password: String
    let firstName: String
    let surname: String
    let username: String
    let phone: String
    let age: Int
    let sex: String
    let driver: Bool
    let id: Int
}
