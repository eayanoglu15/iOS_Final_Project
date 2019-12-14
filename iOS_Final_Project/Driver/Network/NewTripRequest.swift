//
//  NewTripRequest.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 14.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct NewTripRequest: Codable {
    let from: String
    let to: String
    let startTime: String
    let endTime: String
    let totalSeatNumber: Int
    let driverUserName: String
}
