//
//  DriverNewTripDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol DriverNewTripDataSourceDelegate {
    func showAlertMsg (title: String , message :String)
    func returnToDriverHome()
}

class DriverNewTripDataSource {
    var driver: User?
    
    var fromArray = [String]()
    var toArray = [String]()
    
    var fromLocation: String?
    var toLocation: String?
    
    var startTime: String?
    var endTime: String?
    
    var seatNumbers: Int?
    
    var delegate: DriverNewTripDataSourceDelegate?
    
    init() {
        self.fromArray = ["Koç", "Batı", "Sarıyer", "Hacıosman"]
        self.toArray = ["Koç", "Batı", "Sarıyer", "Hacıosman"]
    }
    func getFromTo() {
        let session = URLSession.shared
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        
        if let url = URL(string: "\(baseURL)trip/getFromToLocations") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //print("HERE Other Data: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let response = try! decoder.decode(FromToResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    self.fromArray = response.fromToLocationList
                    self.toArray = response.fromToLocationList
                }
            }
            
            dataTask.resume()
        }
        
    }
    func createTrip(from: String, to: String, startTime: String, endTime: String, seatNum: Int, driverUsername: String) {
        
        let tripRequest = NewTripRequest(from: from, to: to, startTime: startTime, endTime: endTime, totalSeatNumber: seatNum, driverUserName: driverUsername)
        
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))trip/createTrip") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
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
                                self.delegate?.showAlertMsg(title:"Sorry",message:"Please give us time we will fix it. ")
                            }
                            return
                        }
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(ApiResponse.self, from: data)
                        if (response.success){
                            DispatchQueue.main.async {
                                self.delegate?.returnToDriverHome()
                            }
                        }else{
                            DispatchQueue.main.async {
                                self.delegate?.showAlertMsg(title:"Sorry",message:response.message  )
                            }
                            return
                        }
                        
                    }
                }
            }
            uploadTask.resume()
        }
        
        
        
        
    }
    
}
