//
//  DriverHomeDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

class DriverHomeDataSource {
    var driver: User?
   
    var acceptedRequests = [TripRequest]()
    var waitingRequests = [TripRequest]()
    
    init() {
        acceptedRequests.append(TripRequest(from: "Koç", to: "Batı", startTime: "16.00", endTime: "16.15", id: 1, hitchHikerUserName: "Okan", rating: 4))
        acceptedRequests.append(TripRequest(from: "Koç", to: "Batı", startTime: "16.00", endTime: "16.15", id: 1, hitchHikerUserName: "Muharrem", rating: 4))
        
        waitingRequests.append(TripRequest(from: "Koç", to: "Batı", startTime: "16.00", endTime: "16.15", id: 1, hitchHikerUserName: "Melis", rating: 4))
        
    }
    
    func contextualTripAcceptAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        // 1
        var trip = waitingRequests[indexPath.row]
        // 2
        let action = UIContextualAction(style: .normal,
                                        title: "Accept") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
         print("Accepted")
         completionHandler(true)
            
        }
        // 7
        action.backgroundColor = UIColor.green
        return action
    }
    
    func contextualTripDenyAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        // 1
        var trip = waitingRequests[indexPath.row]
        // 2
        let action = UIContextualAction(style: .normal,
                                        title: "Deny") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
         print("Denied")
         completionHandler(true)
            
        }
        // 7
        action.backgroundColor = UIColor.red
        return action
    }
    
}
