//
//  UserRepository.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 25/08/2023.
//

import Foundation

protocol UserRepository {
    
    func getUser()
    
}

class DefaultUserRepository: UserRepository {
    
    func getUser() {
        
    }
}
