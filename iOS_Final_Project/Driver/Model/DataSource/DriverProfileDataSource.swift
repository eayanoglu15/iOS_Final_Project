//
//  DriverProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

extension DriverProfileDataSource: AWSS3ManagerDelegate {
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
        }
    }
}

protocol DriverProfileDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func userLoaded()
}

class DriverProfileDataSource {
    let awsManager = AWSS3Manager()
    var delegate: DriverProfileDataSourceDelegate?
    var userResponse: GetUserResponse?
    var driver: User?
    
    init() {
        awsManager.delegate = self
    }
    
    func getUser(username: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(NetworkConstants.baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let userResponse = try! decoder.decode(GetUserResponse.self, from: data)
                        self.userResponse = userResponse
                        let fileName = userResponse.image.deletingPrefix(NetworkConstants.baseS3URL)
                        self.awsManager.downloadFile(key: fileName)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func setUser(image: UIImage, response: GetUserResponse) {
        driver = User(profileImage: image, isDriver: true, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
        driver?.id = response.id
        driver?.rating=response.point
        driver?.voteNumber=response.numberRevieved
        DispatchQueue.main.async {
            self.delegate?.userLoaded()
        }
    }
}
