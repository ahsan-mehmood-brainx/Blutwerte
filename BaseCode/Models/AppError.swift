//
//  AppError.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import Foundation
import ObjectMapper

class AppError: Mappable, Error {
    var message: String?
    var code = 600
    
    init(message: String? = nil, code: Int = 600) {
        self.message = message
        self.code = code
    }
    
    required init?(map: Map) {
        let requiredKey = "error"
        let keys = Array(map.JSON.keys)
        if !keys.contains(requiredKey), !keys.contains("errors") {
            return nil
        }
    }
    
    func mapping(map: Map) {
        let keys = Array(map.JSON.keys)
        if keys.contains("error") {
            if let error = map.JSON["error"] as? [String: Any], error.keys.count > 0 {
                if let issues = error["message"] as? String {
                    message = issues
                } else {
                    if let issue = error[error.keys.first!] as? NSArray {
                        message = issue[0] as? String
                    }
                }
            } else if let error = map.JSON["error"] as? String {
                message = error
            }
            
        } else {
            if let errors = map.JSON["errors"] as? [String], errors.count > 0 {
                if let issues = errors.first {
                    message = issues
                }
            }
        }
    }
}
