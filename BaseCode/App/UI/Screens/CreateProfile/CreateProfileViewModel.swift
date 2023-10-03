//
//  CreateProfileViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 25/08/2023.
//

import Combine
import Foundation

class CreateProfileViewModel: ViewModel {
    
    //MARK: - Properties
    
    @Published var age: Int = 0
    @Published var gender: Gender? = nil
    @Published var avatar: Avatar?
    @Published var currentNameCount: Int = 0
    
    let maxNameCount: Int = 15
    var userName: String = .empty {
        didSet {
            currentNameCount = userName.count
            if currentNameCount > maxNameCount {
                userName = String(userName.prefix(maxNameCount))
                currentNameCount = maxNameCount
            }
        }
    }
    
    //MARK: - Methods
    
    func handleAgeViewTapped() {
        router.showSheet(.ageSelection(age: age) { [weak self] age in
            self?.age = age
        })
    }
    
    func handleAddAvatarTapped() {
        router.showSheet(.avatar(avatar: avatar) { [weak self] avatar in
            self?.avatar = avatar
        })
    }
    
    func validateUser() -> ValidationStatus {
        guard let avatar = avatar else {
            return .invalid(message: L10n.Localizable.kindlyAddImage)
        }
        guard userName.count > 0 else {
            return .invalid(message: L10n.Localizable.kindlyAddName)
        }
        guard age > 0 else {
            return .invalid(message: L10n.Localizable.kindlyAddAge)
        }
        guard let gender = gender else {
            return .invalid(message: L10n.Localizable.kindlySelectGender)
        }
        return .valid
    }
    
    func showPolicyScreen() {
        router.showSheet(.policy)
    }
}
