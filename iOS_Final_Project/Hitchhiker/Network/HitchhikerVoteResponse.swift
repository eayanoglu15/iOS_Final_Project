//
//  HitchhikerVoteResponse.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct HitchhikerVoteResponse: Codable {
    let votedTrip: [HitchhikerTripRequest]?
    let nonVotedTrip: [HitchhikerTripRequest]?
    let tripExist: Bool
}
