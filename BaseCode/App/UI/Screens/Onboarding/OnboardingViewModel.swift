//
//  OnboradingViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 23/08/2023.
//

import Foundation
import SwiftDI

class OnboardingViewModel: ViewModel {
    
    //MARK: - Properties
    
    @Injected var repository: UserRepository
    let onboardingCells: [Onboarding] = [
        Onboarding(
            imageName: Asset.heartCare.name,
            showAnimation: false,
            title: L10n.Localizable.onboarding1Title,
            descpription: L10n.Localizable.onboarding1Description
        ),
        Onboarding(
            imageName: Asset.sheild.name,
            showAnimation: false,
            title: L10n.Localizable.onboarding2Title,
            descpription: L10n.Localizable.onboarding2Description
        ),
        Onboarding(
            imageName: Asset.textFile.name,
            showAnimation: false,
            title: L10n.Localizable.onboarding3Title,
            descpription: L10n.Localizable.onboarding3Description
        ),
        Onboarding(
            imageName: nil,
            showAnimation: true,
            title: L10n.Localizable.onboarding4Title,
            descpription: L10n.Localizable.onboarding4Description
        )
    ]
    
    //MARK: - Methods
    
    func moveToCreateProfile() {
        router.append(.createProfile)
    }
}
