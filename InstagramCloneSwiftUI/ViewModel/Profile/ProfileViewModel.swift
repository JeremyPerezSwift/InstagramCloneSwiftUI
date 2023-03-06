//
//  ProfileViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/03/2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        UserService.follow(uid: uid) { _ in
            
        }
    }
    
    func unfollow() {
        
    }
    
    func checkIfUserIsFollowed() {
        
    }
}
