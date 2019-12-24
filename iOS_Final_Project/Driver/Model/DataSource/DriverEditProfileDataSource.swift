//
//  DriverEditProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 12.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

protocol DriverEditProfileDataSourceDelegate {
    func showAlert(title: String, message: String)
    func goToProfile()
}

class DriverEditProfileDataSource {
    var driver: User?
    var delegate: DriverEditProfileDataSourceDelegate?
    
    func updateDriver(id:Int, username: String, password: String, name: String, surname: String, email: String, phonenumber: String, age: Int, gender: String, carModel: String, plaque: String) {
        let session = URLSession.shared
        let driverRequest = DriverUpdateRequest(id: id, username: username, password: password, firstName: name, surname: surname, email: email, phone: phonenumber, age: age, gender: gender, isDriver: false, carModel: carModel, plaque: plaque)
        if let url = URL(string: "\(NetworkConstants.baseURL)users/updateUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(driverRequest)
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlert(title: "Error", message: "\(error)")
                    }
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(GetUserResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.delegate?.goToProfile()
                        }
                    }
                }
            }
            uploadTask.resume()
        }
    }
}
