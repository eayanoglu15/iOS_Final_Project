//
//  NewHitchhikerDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit
protocol NewHitchhikerDataSourceDelegate {
    func showAlertMsg (title: String , message :String)
    func goToHomePage()
}

class NewHitchhikerDataSource: BaseDataSource {
    var user: User?
    var delegate: NewHitchhikerDataSourceDelegate?
    
    func addNewHitchihiker(profileImage:String,
                           username: String,
                           password: String,
                           name: String,
                           surname: String,
                           email: String,
                           phonenumber: String,
                           age: Int,
                           gender: String) {
        let createHitchHikerRequest = CreateHitchhikerRequest(image:profileImage, username: username, password: password, firstName: name, surname: surname, driver: false, email: email, phone: phonenumber, age: age, sex: gender)
        //let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))users/newUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(createHitchHikerRequest)
            
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
                            let dataDecoded : Data = Data(base64Encoded:profileImage, options: .ignoreUnknownCharacters)!
                            let userDefaults = UserDefaults.standard
                            userDefaults.setValue(true, forKey: "userLoggedIn")
                            userDefaults.setValue(false, forKey: "userIsDriver")
                            userDefaults.setValue(username, forKeyPath: "username")
                            self.user = User(profileImage:UIImage(data: dataDecoded)!,isDriver: false, username: username, password: password,
                                             name: name, surname: surname, email: email,
                                             phonenumber: phonenumber, age: age, sex: gender)
                            DispatchQueue.main.async {
                                self.delegate?.goToHomePage()
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
