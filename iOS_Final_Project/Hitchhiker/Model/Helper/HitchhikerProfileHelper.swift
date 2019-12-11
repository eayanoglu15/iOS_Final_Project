//
//  HitchhikerProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerProfileHelper {
    var hitchhikerInfoArray = [(String, String)]()
    
    func getInfoArray(hitchhiker: User) {
        let name = hitchhiker.firstName
        let surname = hitchhiker.surname
        hitchhikerInfoArray.append(("Name", "\(name) \(surname)"))
        
        let email = hitchhiker.email
        hitchhikerInfoArray.append(("Email", email))
        
        let phone = hitchhiker.phoneNumber
        hitchhikerInfoArray.append(("Phone Number", phone))
        
        let age = hitchhiker.age
        hitchhikerInfoArray.append(("Age", "\(age)"))
    }
    
}
