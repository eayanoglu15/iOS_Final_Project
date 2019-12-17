//
//  HitchhikerOtherProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit
protocol HitchhikerOtherProfileDataSourceDelegate {
    func otherUserLoaded()
    
}

class HitchhikerOtherProfileDataSource {
    var otherUsername: String = ""
    var otherUser: User?
    var delegate: HitchhikerOtherProfileDataSourceDelegate?
    
    func getOtherUser() {
        let session = URLSession.shared
        let baseURL = "http://127.0.0.1:8080/"
        
        if let url = URL(string: "\(baseURL)users/\(otherUsername)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                print("HERE: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let response = try! decoder.decode(LoginResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    self.setUser(response: response)
                    self.delegate?.otherUserLoaded()
                }
            }
            
            dataTask.resume()
        }
        
    }
    func setUser(response: LoginResponse) -> Bool {
          let isDriver = response.driver
        let dataDecoded : Data = Data(base64Encoded:response.image, options: .ignoreUnknownCharacters)!
          if isDriver {
            otherUser = User(profileImage:UIImage(data: dataDecoded)!,isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
          } else {
              otherUser = User(profileImage:UIImage(data: dataDecoded)!,isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
          }
          return isDriver
      }
}
