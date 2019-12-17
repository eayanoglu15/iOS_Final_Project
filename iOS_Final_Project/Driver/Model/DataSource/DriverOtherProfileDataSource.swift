//
//  DriverOtherProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol DriverOtherProfileDataSourceDelegate {
    func otherUserLoaded()
}

class DriverOtherProfileDataSource {
    var otherUsername: String?
    var otherUser: User?
    
    var delegate: DriverOtherProfileDataSourceDelegate?
    
    func getOtherUser() {
        let session = URLSession.shared
        let baseURL = "http://127.0.0.1:8080/"
        guard let username = otherUsername else {
            return
        }
         if let url = URL(string: "\(baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                print("HERE Other Data: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let response = try! decoder.decode(LoginResponse.self, from: data!)
                self.setUser(response: response)
                DispatchQueue.main.async {
                    self.delegate?.otherUserLoaded()
                }
            }
            dataTask.resume()
        }
    }
    
    func setUser(response: LoginResponse) {
          let isDriver = response.driver
          if isDriver {
              otherUser = User(isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
          } else {
              otherUser = User(isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
          }
      }
}
