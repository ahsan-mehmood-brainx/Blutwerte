//
//  AppConstant.swift
//  BaseComponents
//
//  Created by Hunain Shahid on 28/06/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation

class AppConstant {
    struct Title {
        static let popupDelete = "Delete"
    }
    
    struct Message {
        static let popupDelete = "Are you sure you want to delete?"
    }
    
    struct StoryboardId {
        static let main = "Main"
    }
    
    struct ControllerId {
        static let mainViewController = "mainViewController"
    }
    
    struct Server {
        static let BASE_URL = "https://irprime.com/api"
        static let LOGIN_ENDPOINT = BASE_URL + "/login"
        static let SIGNUP_ENDPOINT = BASE_URL + "/signup"
    }
    
    struct Segue {
        static let TO_LOGIN_CONTROLLER = "loginController"
    }
}
