//
//  AppConstants.swift
//  BaseComponents
//
//  Created by Hunain Shahid on 28/06/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation

class AppConstants {
    
    struct Title {
        static let title = "Title"
    }
    
    struct Message {
        static let message = "Message"
    }
    
    struct StoryboardId {
        static let main = "Main"
    }
    
    struct ControllerId {
        static let mainViewController = "mainViewController"
    }
    
    struct Endpoint {
        static let baseURL = "https://www.baseurl.com"
        static let loginURL = baseURL + "/login"
        static let signupURL = baseURL + "/signup"
    }
    
    struct Segue {
        static let toMainController = "mainController"
    }
}
