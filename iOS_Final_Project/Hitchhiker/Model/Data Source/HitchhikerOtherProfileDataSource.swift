//
//  HitchhikerOtherProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

extension HitchhikerOtherProfileDataSource: AWSS3ManagerDelegate {
    func setImageForCell(cell: HitchhikerHomeTableViewCell, img: UIImage) {
        
    }
    
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
            DispatchQueue.main.async {
                self.delegate?.otherUserLoaded()
            }
        }
    }
}

protocol HitchhikerOtherProfileDataSourceDelegate {
    func otherUserLoaded()
}

class HitchhikerOtherProfileDataSource {
    var otherUsername: String = ""
    var otherUser: User?
    var delegate: HitchhikerOtherProfileDataSourceDelegate?
    var awsManager = AWSS3Manager()
    var userResponse: LoginResponse?
    
    func getOtherUser() {
        let session = URLSession.shared
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        
        if let url = URL(string: "\(baseURL)users/\(otherUsername)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //print("HERE: \(String.init(data: data!, encoding: .utf8))")
                
                let decoder = JSONDecoder()
                let response = try! decoder.decode(LoginResponse.self, from: data!)
                print("Image ?: ", response.image)
                self.userResponse = response
                let fileName = response.image.deletingPrefix(NetworkConstants.baseS3URL)
                print("filename: ", fileName)
                self.awsManager.downloadFile(key: fileName)
            }
            
            dataTask.resume()
        }
        
    }
    
    func setUser(image: UIImage, response: LoginResponse) {
          let isDriver = response.driver
          if isDriver {
            otherUser = User(profileImage: image,isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
          } else {
              otherUser = User(profileImage: image, isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
          }
      }
}
