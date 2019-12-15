//
//  HitchhikerTripRequest.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

struct HitchhikerTripRequest: Codable {
    //var profileImage: UIImage?
    var from: String
    var to: String
    var startTime: String
    var endTime: String
    var id: Int
    var driverUserName: String
    var rating: Double
}
