//
//  LocalizedKey.swift
//  BaseCode
//
//  Created by EAPPLE on 27/05/2022.
//  Copyright © 2022 Brainx Technologies. All rights reserved.
//

import Foundation

enum LocalizedKey: String {
    var string: String {
        guard let language = UserDefaultsManager.appLanguage else {
            return NSLocalizedString(rawValue, comment: "")
        }
        return rawValue.localized(language)
    }
    
    case ok
    case error
    case urlNotFound
    case somethingWentWrong
    case success
}
