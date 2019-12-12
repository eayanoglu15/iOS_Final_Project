//
//  NewDriverDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol NewDriverDataSourceDelegate {
    func showAlert (title: String , message :String)
    //func routeToHome(isDriver: Bool)
}

class NewDriverDataSource {
    var user: User?
    var delegate: NewDriverDataSourceDelegate?
    
    func addNewDriver(username: String,
                      password: String,
                      name: String,
                      surname: String,
                      email: String,
                      phonenumber: String,
                      age: Int,
                      carModel: String,
                      plaque: String,
                      gender: String) {
        
        let baseURL = "http://127.0.0.1:8080/users/"
        let createDriverRequest = CreateDriverRequest(username: username, password: password, firstName: name, surname: surname, driver: true, email: email, phone: phonenumber, age: age, carModel: carModel, plaque: plaque, sex: gender)
        
        let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))newUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(createDriverRequest)
            
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                        if statusCode == 500 {
                            DispatchQueue.main.async {
                                self.delegate?.showAlert(title:"Sorry",message:"Please give us time we will fix it. ")
                            }
                            return
                        }
                    }
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(ApiResponse.self, from: data)
                        if (response.success){
                            self.user = User(isDriver: true, username: username, password: password, name:name, surname:surname,
                                email: email, phonenumber: phonenumber, age: age,
                                sex: gender, carModel: carModel, plaque: plaque)
                        }else{
                            DispatchQueue.main.async {
                                self.delegate?.showAlert(title:"Sorry",message:response.message  )
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
