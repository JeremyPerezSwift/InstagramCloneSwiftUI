//
//  NotificationViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 08/03/2023.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self) })
        }
    }
    
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        if uid != user.id {
            var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                       "username": user.username,
                                       "uid": user.id ?? "",
                                       "profileImageURL": user.profileImageURL,
                                       "type": type.rawValue]
            
            if let post = post, let postId = post.id {
                data["postId"] = postId
            }
            
            COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
        }
    }
    
}
