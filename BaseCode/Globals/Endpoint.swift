//
//  Endpoint.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import Foundation

enum Endpoint {
    // MARK: - Auth EndPoints
    
    static var login: URL? {
        URL(string: "auth/login", relativeTo: Environment.baseUrl)
    }
}
