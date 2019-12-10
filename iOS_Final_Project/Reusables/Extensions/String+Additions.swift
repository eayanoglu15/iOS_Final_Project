//
//  String+Additions.swift
//  iOS_Final_Project
//
//  Created by Ege Melis Ayanoğlu on 4.12.2019.
//  Copyright © 2019 Bogo. All rights reserved.
//

import Foundation

extension String {
    /// Checks if string is alphabetic
    var isAlphabetic: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.letters.inverted) == nil
    }
    
    /// Checks if string is alpha numeric
    var isAlphanumeric: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
    }
    
    /// Checks if string is numeric
    var isNumeric: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var isValidEmail: Bool {
       let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
       return testEmail.evaluate(with: self)
    }
}
