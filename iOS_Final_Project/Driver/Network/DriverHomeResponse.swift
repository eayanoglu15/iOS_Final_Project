//
//  DriverHomeResponse.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 14.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct DriverHomeResponse: Codable {
    let acceptedRequest: [TripRequest]?
    let requests: [TripRequest]?
    let tripExist: Bool
}
