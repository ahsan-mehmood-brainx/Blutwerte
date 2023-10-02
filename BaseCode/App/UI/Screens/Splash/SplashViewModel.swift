//
//  SplashViewModel.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import Combine
import Foundation

class SplashViewModel: ViewModel {
    
    //MARK: - Functions
    
    func moveToNextScreen() {
        router.append(.onboarding)
    }
}
