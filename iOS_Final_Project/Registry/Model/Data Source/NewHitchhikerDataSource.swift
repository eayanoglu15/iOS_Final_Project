//
//  NewHitchhikerDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

protocol NewHitchhikerDataSourceDelegate {
    func showAlert (title: String , message :String)
    //func routeToHome(isDriver: Bool)
}

class NewHitchhikerDataSource {
    var user: User?
    var delegate: NewHitchhikerDataSourceDelegate?
    
    func addNewHitchihiker(username: String,
                           password: String,
                           name: String,
                           surname: String,
                           email: String,
                           phonenumber: String,
                           age: Int,
                           gender: String) {
         let baseURL = "http://127.0.0.1:8080/users/"
         let createHitchHikerRequest = CreateHitchhikerRequest(username: username, password: password, firstName: name, surname: surname, driver: false, email: email, phone: phonenumber, age: age, sex: gender)
        let session = URLSession.shared
        
        if let url = URL(string: "\(String(describing: baseURL))newUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(createHitchHikerRequest)
            
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
                            self.user = User(isDriver: false, username: username, password: password,
                            name: name, surname: surname, email: email,
                            phonenumber: phonenumber, age: age, sex: gender)
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