//
//  HitchhikerFeedDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

class HitchhikerHomeDataSource {
    var hitchhiker: User?
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
    
    func contextualTripRequestAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
           // 1
           var feed = feedArray[indexPath.row]
           // 2
           let action = UIContextualAction(style: .normal,
                                           title: "Send Request") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
            print("HEY")
            completionHandler(true)
               
           }
           // 7
           action.backgroundColor = UIColor.orange
           return action
       }
}
