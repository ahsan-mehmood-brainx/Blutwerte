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
    var selectedAvatar: ((Avatar?) -> Void)?
    
    //MARK: - Methods
    
    func handleCloseTapped() {
        router.dismiss()
    }
    
    func handleActionButtonTapped() {
        selectedAvatar?(avatar)
        router.dismiss()
    }
}
