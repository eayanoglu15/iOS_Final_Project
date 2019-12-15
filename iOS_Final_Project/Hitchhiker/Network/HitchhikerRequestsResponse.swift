//
//  HitchhikerRequestsResponse.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 15.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

struct HitchhikerRequestsResponse: Codable {
    let acceptedRequests: [HitchhikerTripRequest]?
    let waitingRequests: [HitchhikerTripRequest]?
    let rejectedRequests: [HitchhikerTripRequest]?
    let tripExist: Bool
}
