//
//  String+Extentions.swift
//  iCareBenefit
//
//  Created by Nam Truong on 6/10/15.
//  Copyright © 2015 Nam Truong. All rights reserved.
//

import UIKit
import CoreTelephony


extension String {

    public var isNotEmpty: Bool {
        return !isEmpty
    }
    
    var dateFromISO8601: Date? {
        return Date.Formatter.iso8601.date(from: self)
    }
    
    var dateFromDateString: Date? {
        return Date.Formatter.dateFormat.date(from: self)
    }
    
    var dateFromTimeString: Date? {
        return Date.Formatter.timeFormat.date(from: self)
    }
    
    var date: Date? {
        get {
            if let d = dateFromISO8601 {
                return d
            }
            
            if let d = dateFromDateString {
                return d
            }
            
            if let d = dateFromTimeString {
                return d
            }
            
            return nil
        }
    }
    
    var pascalCase: String {
        return self.components(separatedBy: " ")
            .map {
                if $0.count <= 1 {
                    return $0.uppercased()
                } else {
                    if $0.index(of: "-") != nil {
                        return $0.components(separatedBy: "-").map { $0.pascalCase }.joined(separator: "-")
                    } else {
                        return $0.capitalized
                    }
                }
            }
            .joined(separator: " ")
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[(start ..< end)])
    }
    
    func IntValue() -> Int? {
        return NumberFormatter().number(from: self)?.intValue
    }
    
    func doubleValue() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func contains(st:String) -> Bool {
        return NSString(string: self).contains(st)
    }
    
    func removeExcessSpace() -> String {
        let tempArray = self.doSplitCharacterOfStringRemoveNilObject(separateString: " ")
        var output = ""
        for (index, element) in tempArray.enumerated() {
            output += element
            if index < (tempArray.count - 1) {
                output += " "
            }
        }
        return output
    }

    func endIndex(of string: String, options: CompareOptions = .literal) -> Int {
        if let stringRange = range(of: string, options: options)?.lowerBound {
            return distance(from: stringRange, to: endIndex)
        }
        return -1
    }
    
    func urlDecode() ->  String {
        return self.removingPercentEncoding!
    }
    
    func split(_ separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    // Get Array From String with separateString and Remove Nil Object
    
    func doSplitStringRemoveNilObject (separateString: String) -> [String] {
        let tempArray = NSMutableArray(array: self.components(separatedBy: separateString))
        tempArray.remove("")
        return NSArray(array: tempArray) as! [String]
    }
    
    func doSplitCharacterOfStringRemoveNilObject (separateString: String) -> [String] {
        let tempArray = NSMutableArray(array: self.components(separatedBy: separateString))
        tempArray.remove("")
        return NSArray(array: tempArray) as! [String]
    }
    
    func toNSDictionary() -> NSDictionary? {
        if let data = self.data(using: String.Encoding.utf8) {
            return data.toNSDictionary()
        } else {
            return nil
        }
        
    }
    
    func toArray() -> NSArray? {
        if let data = self.data(using: String.Encoding.utf8) {
            return data.toArray()
        } else {
            return nil
        }
    }
    
    func toNSString() -> NSString{
        return NSString(string: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_'{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidTRN() -> Bool {
        let components = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let decimalString = components.joined(separator: "")
        
        let PHONE_REGEX = "^((\\+)|())[0-9]{9,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: decimalString)
        return result
    }
    
    func isValidPhone() -> Bool {
        let components = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let decimalString = components.joined(separator: "")
        
        let PHONE_REGEX = "^((\\+)|())[0-9]{1,20}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: decimalString)
        return result
    }
    
    func isValidNumber() -> Bool {
        let components = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let decimalString = components.joined(separator: "")
        
        let PHONE_REGEX = "^((\\+)|())[0-9]{1,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: decimalString)
        return result
    }
    
    func isValidAccount() -> Bool {
        let RegEx = "\\A\\w{1,18}\\z"
        let accountTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return accountTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        let RegEx = ".{6,18}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", RegEx)
        let result =  passwordTest.evaluate(with: self)
        return result
    }
    
    func isValidName() -> Bool {
        let RegEx = ".{1,50}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", RegEx)
        let result =  nameTest.evaluate(with: self)
        return result
    }
    
    func isValidAddress() -> Bool {
        let RegEx = ".{1,200}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", RegEx)
        let result =  nameTest.evaluate(with: self)
        return result
    }
    
    func isValidDescription() -> Bool {
        let RegEx = ".{1,500}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", RegEx)
        let result =  nameTest.evaluate(with: self)
        return result
    }

    func verifyUrl () -> Bool {
        if let url  = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    func currencyFormat() -> String? {
        guard let floatValue = Float(self) else {
            return nil
        }
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter.string(from: NSNumber(value: floatValue))
    }
    
}

