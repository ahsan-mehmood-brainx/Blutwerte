//
//  UserDefaultManager.swift
//  Give Savvy
//
//  Created by Hunain Shahid on 31/01/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation
import ObjectMapper

class UserDefaultManager {
    public static let shared = UserDefaultManager()
    private init () { }
    
    func writeUser (_ user: User) {
        let defaults = UserDefaults.standard
        defaults.setValue(user.toJSON(), forKey: "user.json")
        defaults.synchronize()
    }
    
    func readUser() -> User {
        let defaults = UserDefaults.standard
        if let json = defaults.value(forKey: "user.json") as? [String: Any] {
            return User(JSON: json) ?? User()
        }
        return User()
    }
}
