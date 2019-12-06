//
//  HitchhikerFeedDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerFeedDataSource {
    var feedArray: [HitchhikerFeed] = []
    
    init() {
        feedArray.append(HitchhikerFeed(profileImage: nil, rating: 3.5, username: "Melis", carModel: "Subaru BRZ", from: "Çengelköy",
        to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", availableSeats: 3))
        feedArray.append(HitchhikerFeed(profileImage: nil, rating: 3.5, username: "meh", carModel: "Subaru BRZ", from: "Çengelköy",
        to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", availableSeats: 3))
        feedArray.append(HitchhikerFeed(profileImage: nil, rating: 3.5, username: "Ege", carModel: "Subaru BRZ", from: "Çengelköy",
        to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", availableSeats: 3))
        feedArray.append(HitchhikerFeed(profileImage: nil, rating: 3.5, username: "MelisMelis", carModel: "Subaru BRZ", from: "Çengelköy",
        to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", availableSeats: 3))
        feedArray.append(HitchhikerFeed(profileImage: nil, rating: 3.5, username: "HEY", carModel: "Subaru BRZ", from: "Çengelköy",
        to: "Koç Üniversitesi", departureTime: "14.30 - 15.00", availableSeats: 3))
    }
}
