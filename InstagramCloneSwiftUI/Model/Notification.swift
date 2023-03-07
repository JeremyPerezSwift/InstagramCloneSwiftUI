//
//  Notification.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String?
    let username: String
    let profileImageURL: String
    let timestamp: Timestamp
    let type: Int
    let uid: String
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return " liked one of your posts"
        case .comment: return " commented on one of your post"
        case .follow: return " started following you"
        }
    }
}
