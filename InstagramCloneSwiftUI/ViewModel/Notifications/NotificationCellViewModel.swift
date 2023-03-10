//
//  NotificationCellViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 08/03/2023.
//

import SwiftUI
import Firebase

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        if notification.type == .follow {
            UserService.checkIfUserIsFollowed(uid: notification.uid) { isFollowed in
                self.notification.isFollowed = isFollowed
            }
        }
    }
    
    func fetchNotificationPost() {
        if notification.type != .follow {
            guard let postId = notification.postId else { return }
            
            COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
                self.notification.post = try? snapshot?.data(as: Post.self)
            }
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: User.self)
        }
    }
    
}
