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
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
        }
    }
}

protocol HitchhikerOtherProfileDataSourceDelegate {
    func otherUserLoaded()
    func showAlertMsg(title: String, message: String)
}

class HitchhikerOtherProfileDataSource {
    var otherUsername: String?
    var otherUser: User?
    var delegate: HitchhikerOtherProfileDataSourceDelegate?
    var awsManager = AWSS3Manager()
    var userResponse: LoginResponse?
    
    init() {
        awsManager.delegate = self
    }
    
    func getOtherUser() {
        let session = URLSession.shared
        let baseURL = "http://ec2-18-218-29-110.us-east-2.compute.amazonaws.com:8080/"
        guard let username = otherUsername else {
            return
        }
        if let url = URL(string: "\(baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                //print("HERE: \(String.init(data: data!, encoding: .utf8))")
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(LoginResponse.self, from: data)
                        self.userResponse = response
                        let fileName = response.image.deletingPrefix(NetworkConstants.baseS3URL)
                        self.awsManager.downloadFile(key: fileName)
                    }
                }
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
        otherUser?.rating = response.point
        otherUser?.voteNumber = response.numberRevieved
        DispatchQueue.main.async {
            self.delegate?.otherUserLoaded()
        }
    }
}
