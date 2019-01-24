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

    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }
    
    func length() -> Int {
        return self.characters.count
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
    
    func reverse() -> String {
        return String(self.characters.reversed())
    }
    
    func removeExcessSpace() -> String {
        let tempArray = self.DoSplitStringRemoveNilObject(separateString: " ")
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
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
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

    
    public var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func widthWithConstrainedWidth(font: UIFont) -> CGFloat {
        return self.widthWithConstrainedWidth(font: font)
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
 
}

