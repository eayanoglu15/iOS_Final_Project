//
//  TripRequest.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct TripRequest: Codable {
    let from: String
    let to: String
    let startTime: String
    let endTime: String
    let id: Int
    let hitchHikerUserName: String
    let rating: Double
    let image: String
    let voteGiven: Int?
}
