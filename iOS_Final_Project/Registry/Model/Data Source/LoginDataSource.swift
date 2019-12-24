//
//  LoginDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

extension LoginDataSource: AWSS3ManagerDelegate {
    func setImage(img: UIImage) {
        if let response = loginResponse {
            DispatchQueue.main.async {
                self.delegate?.routeToHome(isDriver: self.setUser(image: img, response: response))
            }
        }
    }
}

protocol LoginDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func routeToHome(isDriver: Bool)
    func removeSpinner()
}

class LoginDataSource {
    var user: User?
    var delegate: LoginDataSourceDelegate?
    var awsManager = AWSS3Manager()
    var loginResponse: LoginResponse?
    
    init() {
        awsManager.delegate = self
    }
    
    func loginUser(username: String, password: String) {
        let loginRequest = LoginRequest(username: username, password: password)
        let session = URLSession.shared
        if let url = URL(string: "\(NetworkConstants.baseURL)users/login") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("AWS key:value", forHTTPHeaderField: "Authorization")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(loginRequest)
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
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        var response: LoginResponse?
                        do {
                            response = try decoder.decode(LoginResponse.self, from: data)
                        } catch {
                            DispatchQueue.main.async {
                                self.delegate?.removeSpinner()
                                self.delegate?.showAlertMsg(title: "Invalid User", message: "Check your username and password")
                            }
                            return
                        }
                        if let response = response {
                            print("success: \(response.username)")
                            
                            let userDefaults = UserDefaults.standard
                            userDefaults.setValue(true, forKey: "userLoggedIn")
                            userDefaults.setValue(response.driver, forKey: "userIsDriver")
                            userDefaults.setValue(response.username, forKeyPath: "username")
                            print("userLoggedIn: ", userDefaults.bool(forKey: "userLoggedIn"))
                            print("userIsDriver: ", userDefaults.bool(forKey: "userIsDriver"))
                            print("username: ",  userDefaults.string(forKey: "username"))
                            
                            self.loginResponse = response
                            let fileName = response.image.deletingPrefix(NetworkConstants.baseS3URL)
                            print("filename: ", fileName)
                            self.awsManager.downloadFile(key: fileName)
                        }
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    func setUser(image: UIImage, response: LoginResponse) -> Bool {
        let isDriver = response.driver
        if isDriver {
            user = User(profileImage: image, isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
        } else {
            user = User(profileImage: image, isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
        }
        return isDriver
    }
}
