//
//  HitchhikerFeedDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

extension HitchhikerHomeDataSource: AWSS3ManagerDelegate {
    func setImageForCell(cell: HitchhikerHomeTableViewCell, img: UIImage) {
        
    }
    
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
        }
    }
}

protocol HitchhikerHomeDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func hitchhikerFeedListLoaded()
}

class HitchhikerHomeDataSource {
    var hitchhiker: User?
    var delegate: HitchhikerHomeDataSourceDelegate?
    var awsManager = AWSS3Manager()
    
    var feedArray: [HitchhikerFeed] = []
    
    var userResponse: GetUserResponse?
    
    init() {
         awsManager.delegate = self
    }
    
    
    func contextualTripRequestAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        // 1
        var trip = feedArray[indexPath.row]
        // 2
        let action = UIContextualAction(style: .normal, title: "Send Request") {
            (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
            print("Sending request...")
            if let user = self.hitchhiker {
                self.makeTripRequest(tripRequestId: trip.id, hitchhikerName: user.username)
            }
            
            completionHandler(true)
        }
        // 7
        action.backgroundColor = UIColor.blue
        return action
    }
    
    func makeTripRequest(tripRequestId: Int, hitchhikerName: String) {
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        let tripRequest = HitchhikerMakeTripRequest(tripId: tripRequestId, hitchHikerUserName: hitchhikerName)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/makeTripRequest") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(tripRequest)
            
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
                        let response = try! decoder.decode(ApiResponse.self, from: data)
                        
                        if (response.success){
                            print("Trip Request Success")
                            // Trip Request Done?
                            // Delete Row?
                        }
                    }
                }
            }
            uploadTask.resume()
        }
        
    }
    
    func getPlannedTrips(hitchhikerName: String) {
        let session = URLSession.shared
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        
        let tripRequest = HitchhikerRequest(hitchhikerUserName: hitchhikerName)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/getAllTrips") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(tripRequest)
            
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
                        //print("data from getPlannedTrips: \(dataString)")
                       
                        let decoder = JSONDecoder()
                        let feedList = try! decoder.decode([HitchhikerFeed].self, from: data)
                        print("feedList.count: ", feedList.count)
                        DispatchQueue.main.async {
                            self.feedArray = feedList
                            self.delegate?.hitchhikerFeedListLoaded()
                        }
                        
                    }
                }
            }
            uploadTask.resume()
        }
        
    }
    
    func getUser(username: String) {
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
                        print("Image ?: ", userResponse.image)
                        self.userResponse = userResponse
                        let fileName = userResponse.image.deletingPrefix(NetworkConstants.baseS3URL)
                        print("filename: ", fileName)
                        self.awsManager.downloadFile(key: fileName)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
func setUser(image: UIImage, response: GetUserResponse) {
            hitchhiker = User(profileImage: image, isDriver: false, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
            self.hitchhiker?.id = response.id
            hitchhiker?.rating=response.point
            hitchhiker?.voteNumber=response.numberRevieved
    }
}
