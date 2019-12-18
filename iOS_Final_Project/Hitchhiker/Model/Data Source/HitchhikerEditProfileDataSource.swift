//
//  HitchhikerEditProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

protocol HitchhikerEditProfileDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    
}

class HitchhikerEditProfileDataSource {
    var hitchhiker: User?
     var delegate: HitchhikerEditProfileDataSourceDelegate?
    func updateHitchihiker(id:Int,username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int, gender: String) {
        let baseURL = "http://127.0.0.1:8080/"
        let session = URLSession.shared
        
        let hitchhikerRequest = HitchhikerUpdateRequest(id:id,username: username,password:password,name:name,surname:surname,email:email,phonenumber: phonenumber,age:age,gender: gender,isDriver:false )
        
        if let url = URL(string: "\(String(describing: baseURL))users/update") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(hitchhikerRequest)
            
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
                                self.delegate?.showAlertMsg(title: "Error", message: "Status Code 500")
                            }
                            return
                        }
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("data: \(dataString)")
                        let decoder = JSONDecoder()
                        let response = try! decoder.decode(GetUserResponse.self, from: data)
                        
                        DispatchQueue.main.async {
                           
                        }
                    }
                }
            }
            uploadTask.resume()
        }
        
        
    }
    
}
