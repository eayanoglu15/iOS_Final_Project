//
//  HitchhikerTripRequestsDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerTripRequestsDataSource {
    var tripRequestArray: [HitchhikerTripRequest] = []
    
    init() {
        tripRequestArray.append(HitchhikerTripRequest(profileImage: nil, rating: 3.5, username: "Melis", carModel: "Subaru BRZ", from: "Çengelköy",
                                                      to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", status: "Accepted"))
    }
}
