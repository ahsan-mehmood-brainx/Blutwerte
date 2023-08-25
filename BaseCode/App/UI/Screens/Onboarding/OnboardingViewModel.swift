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
            imageName: Images.heartCare,
            showAnimation: false,
            title: L10n.Localizable.onboarding1Title,
            descpription: L10n.Localizable.onboarding1Description
        ),
        Onboarding(
            imageName: Images.sheild,
            showAnimation: false,
            title: L10n.Localizable.onboarding2Title,
            descpription: L10n.Localizable.onboarding2Description
        ),
        Onboarding(
            imageName: Images.textFile,
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
}
