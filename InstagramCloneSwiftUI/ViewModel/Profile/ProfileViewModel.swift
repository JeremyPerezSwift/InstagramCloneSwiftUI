//
//  ProfileViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/03/2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserStats()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        
        UserService.follow(uid: uid) { _ in
            NotificationViewModel.uploadNotification(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        if !user.isCurrentUser {
            guard let uid = user.id else { return }
            
            UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
                self.user.isFollowed = isFollowed
            }
        }
    }
    func fetchUserStats() {
        guard let uid = user.id else { return }
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot1, _ in
            guard let following = snapshot1?.documents.count else { return }
            
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot2, _ in
                guard let followers = snapshot2?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot3, _ in
                    guard let posts = snapshot3?.documents.count else { return }
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
                }
            }
        }
    }
    
    func saveUserData(_ bio: String, completion: @escaping(Bool) -> Void) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            completion(true)
        }
    }
    
}
