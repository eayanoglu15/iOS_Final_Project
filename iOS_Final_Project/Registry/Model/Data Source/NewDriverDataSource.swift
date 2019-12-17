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
}

class NewDriverDataSource {
    var user: User?
    var delegate: NewDriverDataSourceDelegate?
    
    func addNewDriver(profileImage:String,
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
        
        let baseURL = "http://127.0.0.1:8080/users/"
        let createDriverRequest = CreateDriverRequest(image: profileImage, username: username, password: password, firstName: name, surname: surname, driver: true, email: email, phone: phonenumber, age: age, carModel: carModel, plaque: plaque, sex: gender)
        
        let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))newUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(createDriverRequest)
            
            let uploadTask = session.uploadTask(with: request, from: uploadData) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let response = response as? HTTPURLResponse {
                        let statusCode = response.statusCode
                        print("statusCode: \(statusCode)")
                        if statusCode == 500 {
                            DispatchQueue.main.async {
                                self.delegate?.showAlertMsg(title:"Sorry",message:"Please give us time we will fix it. ")
                            }
                            return
                        }
                    }
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(ApiResponse.self, from: data)
                        if (response.success){
                            let dataDecoded:NSData = NSData(base64Encoded: profileImage, options: NSData.Base64DecodingOptions(rawValue: 0))!

                            self.user = User(profileImage: UIImage(data: dataDecoded as Data)!,isDriver: true, username: username, password: password, name:name, surname:surname,
                                email: email, phonenumber: phonenumber, age: age,
                                sex: gender, carModel: carModel, plaque: plaque)
                            DispatchQueue.main.async {
                                self.delegate?.goToHome()
                            }
                        }else{
                            DispatchQueue.main.async {
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
