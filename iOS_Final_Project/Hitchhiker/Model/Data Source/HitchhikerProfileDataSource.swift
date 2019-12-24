//
//  HitchhikerProfileDataSource.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 11.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation
import UIKit

extension HitchhikerProfileDataSource: AWSS3ManagerDelegate {
    func setImage(img: UIImage) {
        if let response = userResponse {
            setUser(image: img, response: response)
        }
    }
}

protocol HitchhikerProfileDataSourceDelegate {
    func showAlertMsg(title: String, message: String)
    func userLoaded()
}

class HitchhikerProfileDataSource {
    var hitchhiker: User?
    let awsManager = AWSS3Manager()
    var delegate: HitchhikerProfileDataSourceDelegate?
    var userResponse: GetUserResponse?
    
    init() {
        awsManager.delegate = self
    }
    
    func getUser(username: String) {
        let session = URLSession.shared
        if let url = URL(string: "\(NetworkConstants.baseURL)users/\(username)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.delegate?.showAlertMsg(title: "Error", message: "\(error)")
                    }
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let userResponse = try! decoder.decode(GetUserResponse.self, from: data)
                        self.userResponse = userResponse
                        let fileName = userResponse.image.deletingPrefix(NetworkConstants.baseS3URL)
                        self.awsManager.downloadFile(key: fileName)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func setUser(image: UIImage, response: GetUserResponse) {
        hitchhiker = User(profileImage: image, isDriver: false, username: response.username, password: response.password, name: response.firstName, surname: response.surname, email: response.email, phonenumber: response.phone, age: response.age, sex: response.sex)
        hitchhiker?.id = response.id
        hitchhiker?.rating=response.point
        hitchhiker?.voteNumber=response.numberRevieved
        DispatchQueue.main.async {
            self.delegate?.userLoaded()
        }
    }
}
