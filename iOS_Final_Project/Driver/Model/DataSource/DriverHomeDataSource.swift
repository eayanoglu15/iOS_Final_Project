//
//  DriverHomeDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

protocol DriverHomeDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func loadHomePageData()
    func deleteRow(indexPath: IndexPath)
}

enum Status {
    case noTrip
    case noRequest
    case allWaiting
    case acceptedAndWaiting
    case allAccepted
}

class DriverHomeDataSource {
    var delegate: DriverHomeDataSourceDelegate?
    
    var driver: User?
    
    var acceptedRequests = [TripRequest]()
    var waitingRequests = [TripRequest]()
    var tripExist = false
    
    var status = Status.noTrip
    
    func getStatus() {
        if tripExist {
            if (acceptedRequests.count == 0) && (waitingRequests.count == 0) {
                status = Status.noRequest
            } else {
                if acceptedRequests.count == 0 {
                    status = Status.allWaiting
                } else if waitingRequests.count == 0 {
                    status = Status.allAccepted
                } else {
                    status = Status.acceptedAndWaiting
                }
            }
        } else {
            status = Status.noTrip
        }
    }
    
    func contextualTripAcceptAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        // 1
        var trip = waitingRequests[indexPath.row]
        // 2
        let action = UIContextualAction(style: .normal,
                                        title: "Accept") { (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
         print("Accepted")
         self.hitchhikerAcception(isAccepted: true, tripRequestId: trip.id, indexPath: indexPath)
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
                 // delete cell
                                            //
                                            
                                            self.hitchhikerAcception(isAccepted: false, tripRequestId: trip.id, indexPath: indexPath)
                                            
                                            
         completionHandler(true)
            
        }
        // 7
        action.backgroundColor = UIColor.red
        return action
    }
    
    func getUser(username: String) {
        print("getUser")
        let session = URLSession.shared
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        
        if let url = URL(string: "\(baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                    
                    } else {
                        if let response = response as? HTTPURLResponse {
                            let statusCode = response.statusCode
                            print("statusCode: \(statusCode)")
                            if statusCode == 500 {
                                DispatchQueue.main.async {
                                    self.delegate?.showAlertMsg(title: "Error", message: "Status Code 500")
                                }
                                return
                            }
                        }
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            //print("data: \(dataString)")
                            
                            let decoder = JSONDecoder()
                            let userResponse = try! decoder.decode(GetUserResponse.self, from: data)
                            
                            DispatchQueue.main.async {
                                self.setUser(response: userResponse)
                            }
                        }
                    }
                }
                /*
                print("HERE: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let userResponse = try! decoder.decode(GetUserResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    self.setUser(response: userResponse)
                }
            }*/
            dataTask.resume()
        }
        
    }
    
    func setUser(response: GetUserResponse) {
        
        let dataDecoded : Data = Data(base64Encoded:response.image, options: .ignoreUnknownCharacters)!
        driver = User(profileImage:UIImage(data: dataDecoded)!,isDriver: true, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
        driver?.id = response.id
        driver?.rating=response.point
        driver?.voteNumber=response.numberRevieved
    }
    
    // removeCell
    func hitchhikerAcception(isAccepted: Bool, tripRequestId: Int, indexPath: IndexPath) {
        var str = isAccepted ? "acceptRequest" : "declineRequest"
        
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        let acceptionRequest = TripAcceptionRequest(tripRequestId: tripRequestId)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/\(str)") {
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let encoder = JSONEncoder()
                let uploadData = try! encoder.encode(acceptionRequest)
                
                let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                    if let error = error {
                        DispatchQueue.main.async {
                            self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                        }
                    } else {
                        if let response = response as? HTTPURLResponse {
                            let statusCode = response.statusCode
                            print("statusCode: \(statusCode)")
                            if statusCode == 500 {
                                DispatchQueue.main.async {
                                    self.delegate?.showAlertMsg(title: "Error", message: "Status Code 500")
                                }
                                return
                            }
                        }
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            print("data: \(dataString)")
                            let decoder = JSONDecoder()
                            let response = try! decoder.decode(ApiResponse.self, from: data)
                            
                            DispatchQueue.main.async {
                                self.delegate?.deleteRow(indexPath: indexPath)
                                //self.delegate?.loadHomePageData()
                            }
                        }
                    }
                }
                uploadTask.resume()
            }
            
        }
    
    
    func getHomePageData(driverName: String) {
        print("getHomePageData")
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        let driverRequest = DriverHomeRequest(driverUserName: driverName)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/getAllRequestsByDriver") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(driverRequest)
            
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                        if statusCode == 500 {
                            DispatchQueue.main.async {
                                self.delegate?.showAlertMsg(title: "Error", message: "Status Code 500")
                            }
                            return
                        }
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        //print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(DriverHomeResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            if let acceptedReqs = response.acceptedRequest {
                                 self.acceptedRequests = acceptedReqs
                                print("acceptedRequests.count: ", acceptedReqs.count)
                            }
                            if let waitings = response.requests {
                                self.waitingRequests = waitings
                                print("waitingRequests.count: ", waitings.count)
                            }
                            
                            self.tripExist = response.tripExist
                            
                            print("tripExist: ", self.tripExist)
                            // reload home table view
                            self.getStatus()
                            self.delegate?.loadHomePageData()
                        }
                    }
                }
            }
            uploadTask.resume()
        }
        
    }
}


