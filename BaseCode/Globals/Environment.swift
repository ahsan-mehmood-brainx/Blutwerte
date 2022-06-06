//
//  Environment.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import Foundation

enum Environment {
    case development
    case production
    
    static var current: Environment { return .development }
    
    static var baseUrl: URL? {
        switch current {
            case .development: return URL(string: "base_url_for_development")
            case .production: return URL(string: "base_url_for_production")
        }
    }
}
