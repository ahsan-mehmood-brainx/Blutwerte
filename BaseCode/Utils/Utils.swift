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

class Utils {
    
    static func generateUUIDString() -> String {
        var st = UUID().uuidString.components(separatedBy: " ").last!.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
        st = st.replacingOccurrences(of: "-", with: "", options: .literal, range: nil).lowercased()
        return st
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
        } else {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount
    }
    
}
