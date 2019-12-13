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
    
    func getUser(username: String) {
        let session = URLSession.shared
        let baseURL = "http://127.0.0.1:8080/"
        
        if let url = URL(string: "\(baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                print("HERE: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let userResponse = try! decoder.decode(GetUserResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    self.setUser(response: userResponse)
                }
            }
            dataTask.resume()
        }
        
    }
    
    func setUser(response: GetUserResponse) {
        driver = User(isDriver: true, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
    }
    
}
