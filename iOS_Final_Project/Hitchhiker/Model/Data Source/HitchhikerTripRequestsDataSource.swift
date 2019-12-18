//
//  HitchhikerTripRequestsDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol HitchhikerTripRequestsDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func loadData()
}

class HitchhikerTripRequestsDataSource {
    var hitchhiker: User?
    
    var delegate: HitchhikerTripRequestsDataSourceDelegate?
    
    var acceptedRequests = [HitchhikerTripRequest]()
    var waitingRequests = [HitchhikerTripRequest]()
    var rejectedRequests = [HitchhikerTripRequest]()
    var requestExist = false
    
    func getPageData(hitchhikerUsername: String) {
        let baseURL = "http://127.0.0.1:8080/"
        let session = URLSession.shared
        
        let hitchhikerRequest = HitchhikerRequest(hitchhikerUserName: hitchhikerUsername)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/getAllRequestsByHitchhiker") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(hitchhikerRequest)
            
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
                        let response = try! decoder.decode(HitchhikerRequestsResponse.self, from: data)
                
                        DispatchQueue.main.async {
                            if let acceptedReqs = response.acceptedRequests {
                                 self.acceptedRequests = acceptedReqs
                                print("acceptedReqs.count: ",acceptedReqs.count)
                            }
                            if let waitings = response.waitingRequests {
                                self.waitingRequests = waitings
                                print("waitings.count: ", waitings.count)
                            }
                            
                            if let rejects = response.rejectedRequests {
                                self.rejectedRequests = rejects
                                print("rejects.count: ", rejects.count)
                            }
                            self.requestExist = response.tripExist
                            print("response.tripExist: ", response.tripExist)
                            
                            self.delegate?.loadData()
                        }
                    }
                }
            }
            uploadTask.resume()
        }
        
    }
}
