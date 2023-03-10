//
//  FeedCellViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class FeedCellViewModel: ObservableObject {
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes <= 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
        fetchNotificationUser()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("posts-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                NotificationViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLike = true
                self.post.likes += 1
            }
        }
    }
    
    func unlike() {
        if post.likes > 0 {
            guard let uid = AuthViewModel.shared.userSession?.uid else { return }
            guard let postId = post.id else { return }
            
            COLLECTION_POSTS.document(postId).collection("posts-likes").document(uid).delete { _ in
                COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                    COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                    
                    self.post.didLike = false
                    self.post.likes -= 1
                }
            }
        }
    }
    
    func checkIfUserLikedPost() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(post.ownerUid).getDocument { snapshot, _ in
            self.post.user = try? snapshot?.data(as: User.self)
        }
    }
    
}
