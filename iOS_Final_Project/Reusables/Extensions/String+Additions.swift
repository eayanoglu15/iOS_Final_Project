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
        dateFormatter.dateFormat = DateFormat.networkUTC
        guard let date = dateFormatter.date(from: self) else {
            // 2019-12-14T23:23:33.986Z
            dateFormatter.dateFormat = DateFormat.network
            guard let date = dateFormatter.date(from: self) else {
                return self
            }
            dateFormatter.dateFormat = DateFormat.display
            return dateFormatter.string(from: date)
        }
        dateFormatter.dateFormat = DateFormat.display
        return dateFormatter.string(from: date)
    }
    
    func UTCToLocal() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.networkUTC //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: self)
        dateFormatter.dateFormat = DateFormat.display // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    
    func localToUTC() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat.display
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current

        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = DateFormat.network
        
        guard let date = dt else {
           return nil
        }
        return dateFormatter.string(from: date)
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
