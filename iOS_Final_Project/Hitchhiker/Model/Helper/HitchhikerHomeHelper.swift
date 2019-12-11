//
//  HitchhikerHomeHelper.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 6.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

class HitchhikerHomeHelper {
    var selectedUsername: String?
    
    func getRatingImageArray(rating: Double) -> [String] {
        var ratingImageArray = [String]()
        ratingImageArray = ["star.fill", "star.fill",
            "star.lefthalf.fill", "star", "star"]
        return ratingImageArray
    }
    /*
    func setSelectedUser(indexPath: IndexPath) {
        selectedAccount = searched[indexPath.item]
        /*
        if searchActive {
            selectedAccount = searched[indexPath.item]
        } else if filterActive {
            selectedAccount = filtered[indexPath.item]
        } else {
            selectedAccount = userAccounts[indexPath.item]
        }
         */
    }
    */
}
