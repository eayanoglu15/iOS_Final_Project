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
    func showAlert(title: String, message: String)
    func goToProfile()
}

class HitchhikerEditProfileDataSource {
    var hitchhiker: User?
    var delegate: HitchhikerEditProfileDataSourceDelegate?
    
    func updateHitchihiker(id: Int, username: String, password: String, name: String,
                           surname: String, email: String, phonenumber: String,
                           age: Int, gender: String) {
        let session = URLSession.shared
        let hitchhikerRequest = HitchhikerUpdateRequest(email: email, password: password, firstName: name, surname: surname, username: username, phone: phonenumber, age: age, sex: gender, driver: false, id: id)
        if let url = URL(string: "\(NetworkConstants.baseURL)users/updateUser") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(hitchhikerRequest)
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
