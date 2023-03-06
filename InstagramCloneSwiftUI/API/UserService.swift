//
//  UserService.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 06/03/2023.
//

import Firebase
import FirebaseFirestore

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUid).setData([:], completion: completion)
        }
        
    }
    
    static func unfollow() {
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
    
}
