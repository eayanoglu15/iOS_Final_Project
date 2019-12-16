//
//  DriverVoteResponse.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct DriverVoteResponse: Codable {
    let votedTrip: [TripRequest]?
    let nonVotedTrip: [TripRequest]?
    let tripExist: Bool
}
