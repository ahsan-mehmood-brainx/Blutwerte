//
//  Gender.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import Foundation

enum Gender: Int {
    
    case male
    case female
    
    var title: String {
        switch self {
        case .male:
            return L10n.Localizable.male
        case .female:
            return L10n.Localizable.female
        }
    }
}
