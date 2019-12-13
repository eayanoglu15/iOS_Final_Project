//
//  HitchhikerFeedDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

protocol HitchhikerHomeDataSourceDelegate {
    func hitchhikerFeedListLoaded(feedList: [HitchhikerFeed])
    
}

class HitchhikerHomeDataSource {
    var hitchhiker: User?
    var delegate: HitchhikerHomeDataSourceDelegate?
    
    func getPlannedTrips() {
        let session = URLSession.shared
        let baseURL = "http://127.0.0.1:8080/"
        
        if let url = URL(string: "\(baseURL)trip/getAllTrips") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                print("HERE: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let feedList = try! decoder.decode([HitchhikerFeed].self, from: data!)
                
                DispatchQueue.main.async {
                    self.delegate?.hitchhikerFeedListLoaded(feedList: feedList)
                }
            }
            
            dataTask.resume()
        }
        
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
        hitchhiker = User(isDriver: false, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
    }
}
