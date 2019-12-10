//
//  LoginDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 10.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol LoginDataSourceDelegate {
    func showAlert ()
}

class LoginDataSource {
    var user: User?
    var delegate: LoginDataSourceDelegate?
    
    func loginUser(username: String, password: String) {
        let baseURL = "http://127.0.0.1:8080/users/"
        let loginRequest = LoginRequest(username: username, password: password)
        
        let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))login") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(loginRequest)
            
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                        if statusCode == 500 {
                            DispatchQueue.main.async {
                                self.delegate?.showAlert()
                            }
                            return
                        }
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(LoginResponse.self, from: data)
                        print("success: \(response.username)")
                        
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    func setUser(response: LoginResponse) {
        let isDriver = response.driver
        if isDriver {
            user = User(isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex, carModel: response.carModel ?? "-", plaque: response.plaque ?? "-")
        } else {
            user = User(isDriver: isDriver, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
        }
    }
}
