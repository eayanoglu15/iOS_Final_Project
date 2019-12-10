//
//  HitchhikerProfileHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 9.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerProfileHelper {
    var hitchhiker: User?
    var hitchhikerInfoArray = [(String, String)]()
    
    func getInfoArray() {
        if let name = hitchhiker?.firstName,
            let surname = hitchhiker?.surname {
            hitchhikerInfoArray.append(("Name", "\(name) \(surname)"))
        }
        if let email = hitchhiker?.email {
            hitchhikerInfoArray.append(("Email", email))
        }
        if let phone = hitchhiker?.phoneNumber {
            hitchhikerInfoArray.append(("Phone Number", phone))
        }
        if let age = hitchhiker?.age {
            hitchhikerInfoArray.append(("Age", "\(age)"))
        }
    }
    
}
