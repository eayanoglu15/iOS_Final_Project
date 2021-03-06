//
//  HitchhikerVotePageDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 16.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol HitchhikerVotePageDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func loadVotePageData()
    func reloadTableView()
    //func deleteRow(indexPath: IndexPath)
}

class HitchhikerVotePageDataSource {
    var hitchhiker: User?
    var delegate: HitchhikerVotePageDataSourceDelegate?
    
    var votedTrips = [HitchhikerTripRequest]()
    var nonVotedTrips = [HitchhikerTripRequest]()
    var tripExist = false
    
    var status = VotePageStatus.noTrip
    
    func getStatus() {
        if tripExist {
            if (votedTrips.count == 0) && (nonVotedTrips.count == 0) {
                status = VotePageStatus.noRequest
            } else {
                if votedTrips.count == 0 {
                    status = VotePageStatus.allWaitingForVote
                } else if nonVotedTrips.count == 0 {
                    status = VotePageStatus.allVoted
                } else {
                    status = VotePageStatus.waitingAndVoted
                }
            }
        } else {
            status = VotePageStatus.noTrip
        }
    }
    
    func getVotePageData(username: String) {
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        let hitchhikerRequest = HitchhikerRequest(hitchhikerUserName: username)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/hitchhikerVotePage") {
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
                        let response = try! decoder.decode(HitchhikerVoteResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                            if let voted = response.votedTrip {
                                self.votedTrips = voted
                                print("voted.count: ", voted.count)
                            }
                            if let nonVoted = response.nonVotedTrip {
                                self.nonVotedTrips = nonVoted
                                print("nonVoted.count: ", nonVoted.count)
                            }
                            self.tripExist = response.tripExist
                            print("tripExist: ", self.tripExist)
                            
                            self.getStatus()
                            print("Status: \(self.status)")
                            self.delegate?.loadVotePageData()
                        }
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    func giveVoteForTrip(tripId: Int, vote: Int) {
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        let session = URLSession.shared
        
        let voteRequest = VoteRequest(tripId: tripId, point: vote, isDriver: false)
        
        if let url = URL(string: "\(String(describing: baseURL))trip/tripPointRequest") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(voteRequest)
            
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
                        
                        if response.success {
                            DispatchQueue.main.async {
                                 self.delegate?.reloadTableView()
                            }
                        }
                    }
                }
            }
            uploadTask.resume()
        }
    }
}
