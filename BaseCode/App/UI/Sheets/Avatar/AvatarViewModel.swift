//
//  AvatarViewModel.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import Foundation

class AvatarViewModel: ViewModel {
    
    //MARK: - Properties
    
    @Published var avatar: Avatar?
    
    //MARK: - Methods
    
    func handleCloseTapped() {
        router.dismiss()
    }
}
