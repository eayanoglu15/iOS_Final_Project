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
    
    func convertUtcToDisplay() -> String {
        let dateFormatter = DateFormatter()
        // 2019-12-15T08:27:05Z
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else {
            // 2019-12-14T23:23:33.986Z
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            guard let date = dateFormatter.date(from: self) else {
                return self
            }
            dateFormatter.dateFormat = "HH:mm\tdd/MM/yy"
            return dateFormatter.string(from: date)
        }
        dateFormatter.dateFormat = "HH:mm\tdd/MM/yy"
        return dateFormatter.string(from: date)
    }
    
    func UTCToLocal() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" //Input Format
        
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        
        var UTCDate = dateFormatter.date(from: self)
        if UTCDate == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
            UTCDate = dateFormatter.date(from: self)
        }
        dateFormatter.dateFormat = "HH:mm\tdd/MM/yy" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
}
