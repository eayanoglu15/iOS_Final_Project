//
//  HitchhikerFeed.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

struct HitchhikerFeed : Codable{
    var rating: Double
    var driverUserName: String
    var carModel: String
    var id: Int
    var from: String
    var to: String
    var distance: Double
    var startTime: String
    var endTime: String
    var availableSeatNumber: Int
    var image: String
}
