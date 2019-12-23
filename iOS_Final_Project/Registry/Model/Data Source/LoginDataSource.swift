//
//  LoginDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit
/*
extension LoginDataSource: AWSS3ManagerDelegate {
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
        }
    }
}
*/
protocol LoginDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func routeToHome(isDriver: Bool)
}

class LoginDataSource : BaseDataSource {
    var user: User?
    var delegate: LoginDataSourceDelegate?
    /*
    var awsManager = AWSS3Manager()
    
    override init() {
            awsManager.delegate = self
       }
    */
    func loginUser(username: String, password: String) {
        let loginRequest = LoginRequest(username: username, password: password)
        
        if let url = URL(string: "\(String(describing: baseURL))users/login") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.addValue("AWS key:value", forHTTPHeaderField: "Authorization")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(loginRequest)
            
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        //print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(LoginResponse.self, from: data)
                        print("success: \(response.username)")
                        
                        DispatchQueue.main.async {
                            let userDefaults = UserDefaults.standard
                            userDefaults.setValue(true, forKey: "userLoggedIn")
                            userDefaults.setValue(response.driver, forKey: "userIsDriver")
                            userDefaults.setValue(response.username, forKeyPath: "username")
                            print("userLoggedIn: ", userDefaults.bool(forKey: "userLoggedIn"))
                            print("userIsDriver: ", userDefaults.bool(forKey: "userIsDriver"))
                            print("username: ",  userDefaults.string(forKey: "username"))
                            self.delegate?.routeToHome(isDriver: self.setUser(response: response))
                        }
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    func setUser(response: LoginResponse) -> Bool {
        let isDriver = response.driver
        let dataDecoded : Data = Data(base64Encoded:response.image, options: .ignoreUnknownCharacters)!
        if isDriver {
            user = User(profileImage:UIImage(data: dataDecoded)!,isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
        } else {
            user = User(profileImage:UIImage(data: dataDecoded)!,isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
        }
        return isDriver
    }
}
