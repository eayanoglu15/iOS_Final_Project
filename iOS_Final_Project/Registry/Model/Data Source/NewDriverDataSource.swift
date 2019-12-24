//
//  NewDriverDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

protocol NewDriverDataSourceDelegate {
    func showAlertMsg (title: String , message :String)
    func goToHome()
    func removeSpinner()
}

class NewDriverDataSource: BaseDataSource {
    var user: User?
    var delegate: NewDriverDataSourceDelegate?
    
    func addNewDriver(profileImage: UIImage,
                      profileImageStr: String,
                      username: String,
                      password: String,
                      name: String,
                      surname: String,
                      email: String,
                      phonenumber: String,
                      age: Int,
                      carModel: String,
                      plaque: String,
                      gender: String) {
        let session = URLSession.shared
        let createDriverRequest = CreateDriverRequest(image: profileImageStr, username: username, password: password, firstName: name, surname: surname, driver: true, email: email, phone: phonenumber, age: age, carModel: carModel, plaque: plaque, sex: gender)
        if let url = URL(string: "\(NetworkConstants.baseURL)users/newUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(createDriverRequest)
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.removeSpinner()
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                        if statusCode == 500 {
                            DispatchQueue.main.async {
                                self.delegate?.removeSpinner()
                                self.delegate?.showAlertMsg(title:"Sorry",message:"Please give us time we will fix it. ")
                            }
                            return
                        }
                    }
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(ApiResponse.self, from: data)
                        if (response.success){
                            let userDefaults = UserDefaults.standard
                            userDefaults.setValue(true, forKey: "userLoggedIn")
                            userDefaults.setValue(true, forKey: "userIsDriver")
                            userDefaults.setValue(username, forKeyPath: "username")
                            self.user = User(profileImage: profileImage, isDriver: true, username: username, password: password, name:name, surname:surname,
                                             email: email, phonenumber: phonenumber, age: age,
                                             sex: gender, carModel: carModel, plaque: plaque)
                            DispatchQueue.main.async {
                                self.delegate?.goToHome()
                            }
                        }else{
                            DispatchQueue.main.async {
                                self.delegate?.removeSpinner()
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
