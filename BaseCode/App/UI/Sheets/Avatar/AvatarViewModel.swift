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
    var selectedAvatar: ((Avatar?) -> Void)
    
    //MARK: - Initializers
    
    init(avatar: Avatar?, selectedAvatar: @escaping (Avatar?) -> Void) {
        self.avatar = avatar
        self.selectedAvatar = selectedAvatar
    }
    
    //MARK: - Methods
    
    func handleCloseTapped() {
        router.dismiss()
    }
    
    func handleActionButtonTapped() {
        selectedAvatar(avatar)
        router.dismiss()
    }
}
