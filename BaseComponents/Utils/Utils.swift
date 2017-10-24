//
//  Utils.swift
//  MyLifeMatters
//
//  Created by Thanh-Tam Le on 11/17/16.
//  Copyright © 2016 Thanh-Tam Le. All rights reserved.
//

import UIKit
import SystemConfiguration
import UserNotifications

protocol AlertDelegate: class {
    func okAlertActionClicked()
}

class Utils {
    
    static func generateUUIDString() -> String {
        var st = UUID().uuidString.components(separatedBy: " ").last!.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
        st = st.replacingOccurrences(of: "-", with: "", options: .literal, range: nil).lowercased()
        return st
    }
    
    static func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlertAction(title: String, message: String, viewController: UIViewController, alertDelegate: AlertDelegate?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "Ok", style: .default) {
            UIAlertAction in
            if alertDelegate != nil {
                alertDelegate?.okAlertActionClicked()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlertMessageAction(title: String, message: String, viewController: UIViewController, alertDelegate: AlertDelegate?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in
            if alertDelegate != nil {
                alertDelegate?.okAlertActionClicked()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url  = URL(string: urlString) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }
    
    static func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }

    static func numberOfDaysInMonth(date: String) -> Int {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        let date = stringToDate(string: date)

        guard let _ = date else {
            return 0
        }

        let range = calendar.range(of: .day, in: .month, for: date!)!

        let numDays = range.count

        return numDays
    }

    static func numberOfDaysBetweenTwoDays(firstDate: String, secondDate: String) -> Int {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!

        let date1 = calendar.startOfDay(for: stringToDate(string: firstDate)!)
        let date2 = calendar.startOfDay(for: stringToDate(string: secondDate)!)

        let components = calendar.dateComponents([.day], from: date1, to: date2)

        return components.day ?? 0
    }

    static func numberOfWeeksBetweenTwoDays(firstDate: String, secondDate: String) -> Int {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!

        let date1 = calendar.startOfDay(for: stringToDate(string: firstDate)!)
        let date2 = calendar.startOfDay(for: stringToDate(string: secondDate)!)

//        let components = calendar.dateComponents([.weekOfYear], from: date1, to: date2)
//
//        return components.weekOfYear ?? 0
        return numberOfWeeks(start: date1, end: date2)
    }

    static func numberOfWeeksInMonth(date: String) -> Int {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        let date = stringToDate(string: date)

        guard let _ = date else {
            return 0
        }

        let range = calendar.range(of: .weekOfMonth, in: .month, for: date!)!

        let numWeeks = range.count
        
        return numWeeks
    }

    static func formatGroupDay(date: Date) -> String {
        var result = ""

        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!

        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let weekday = calendar.component(.weekday, from: date)

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        dateFormatter.dateStyle = .full
        
        result = dateFormatter.shortWeekdaySymbols[weekday - 1] + " " + dateFormatter.shortMonthSymbols[month - 1] + " " + String(day) + ", " + String(year)
        return result
    }

    static func formatGroupMonth(date1: Date, date2: Date) -> String {
        var result = ""

        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!

        let year = calendar.component(.year, from: date1)
        let month = calendar.component(.month, from: date1)
        let day1 = calendar.component(.day, from: date1)
        let day2 = calendar.component(.day, from: date2)
        let weekday1 = calendar.component(.weekday, from: date1)
        let weekday2 = calendar.component(.weekday, from: date2)

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        dateFormatter.dateStyle = .full

        let shortWeek1Day = dateFormatter.shortWeekdaySymbols[weekday1 - 1]
        let shortWeek2Day = dateFormatter.shortWeekdaySymbols[weekday2 - 1]
        let shortMonth = dateFormatter.shortMonthSymbols[month - 1]
        result = shortWeek1Day + "-" + shortWeek2Day + " " + shortMonth + " " + String(day1) + "-" + String(day2) + ", " + String(year)
        return result
    }

    static func getDateOfNextMonth(date: String) -> Date? {
        let newDate = stringToDate(string: date)

        let result = Calendar.current.date(byAdding: .month, value: 1, to: newDate ?? Date())
        return result
    }

    static func getFirstDayInCurrentMonth(date: String) -> Date? {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        
        let newDate = stringToDate(string: date)

        guard let _ = newDate else {
            return nil
        }

        let unitFlags = Set<Calendar.Component>([.year, .month])
        let components = calendar.dateComponents(unitFlags, from: newDate!)
        let startOfMonth = calendar.date(from: components)

        return startOfMonth
    }

    static func getLastDayInCurrentMonth(date: String) -> Date? {
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        
        let newDate = stringToDate(string: date)

        guard let _ = newDate else {
            return nil
        }

        let startOfMonth = getFirstDayInCurrentMonth(date: date)

        guard let _ = startOfMonth else {
            return nil
        }

        let comps2 = NSDateComponents()
        comps2.month = 1
        comps2.day = -1
        let endOfMonth = calendar.date(byAdding: comps2 as DateComponents, to: startOfMonth!)

        return endOfMonth
    }

    static func getSundayFromDate(date: String) -> Date? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        
        let dateFormatter = getDateFormatter()

        let formatedDate = dateFormatter.date(from: date)
        let sundayDif = calendar.component(Calendar.Component.weekday, from: formatedDate!) - 1

        let timeInterval = TimeInterval(exactly: -sundayDif*24*60*60)
        let newDate = formatedDate?.addingTimeInterval(timeInterval!)
        let nextSunday = newDate?.addingTimeInterval(TimeInterval(exactly: 7*24*60*60)!)

        if sundayDif == 0 {
            return newDate
        }
        return nextSunday
    }
    
    static func getSundayFromDate(date: Date?) -> Date? {
        let formatedDate = date
        var calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        calendar.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        let sundayDif = calendar.component(Calendar.Component.weekday, from: formatedDate!) - 1
        
        let timeInterval = TimeInterval(exactly: -sundayDif*24*60*60)
        let newDate = formatedDate?.addingTimeInterval(timeInterval!)
        let nextSunday = newDate?.addingTimeInterval(TimeInterval(exactly: 7*24*60*60)!)
        
        if sundayDif == 0 {
            return newDate
        }
        return nextSunday
    }
    
    static func getMondayFromDate(date: String) -> Date? {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        
        let dateFormatter = getDateFormatter()

        let formatedDate = dateFormatter.date(from: date)
        var mondayDif = calendar.component(Calendar.Component.weekday, from: formatedDate!) - 2
        if mondayDif < 0 {
            mondayDif += 7
        }
        let timeInterval = TimeInterval(exactly: -mondayDif*24*60*60)
        let newDate = formatedDate?.addingTimeInterval(timeInterval!)
        
        return newDate
    }
    
    static func numberOfWeeks(start: Date, end: Date) -> Int {
        var count = 0
        var tempDate = getSundayFromDate(date: start)
        while (tempDate! < end) {
            count += 1
            tempDate = tempDate?.addingTimeInterval(TimeInterval(exactly: 7*24*60*60)!)
        }
        return count
    }
    
    static func stringToDate(string: String) -> Date? {
        let dateFormatter = getDateFormatter()

        let date = dateFormatter.date(from: string)
        return date
    }

    static func dateToString(date: Date) -> String {
        let dateFormatter = getDateFormatter()

        let result = dateFormatter.string(from: date)
        return result
    }
    
    static func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = getDateFormatter()

        let result = dateFormatter.string(from: date)
        
        return result
    }
    
    static func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.ISO8601)! as Calendar
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        
        return dateFormatter
    }
    
    static func getRandomName() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy_MM_dd_HH_mm_ss"
        return "\(dateFormatter.string(from: date as Date))"
    }
    
    static func getRandomColor() -> UIColor{
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    static func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    static func setBadgeIndicator(badgeCount: Int) {
        let application = UIApplication.shared
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in }
        }
        else{
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount
        
//        MainViewController.jobViewController.tabBarItem.badgeValue = (badgeCount == 0) ? nil : "\(badgeCount)"
    }
    
    static func setBadgeIndicatorForStaff(badgeCount: Int) {
        let application = UIApplication.shared
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in }
        }
        else{
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount
        
//        MainViewController.invitationViewController.tabBarItem.badgeValue = (badgeCount == 0) ? nil : "\(badgeCount)"
    }
    
    static func currencyFormat(value: String) -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter.string(from: NSNumber(value: Float(value) ?? 0.0))
    }
}
