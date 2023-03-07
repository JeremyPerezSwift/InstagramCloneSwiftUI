//
//  Comment.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageURL: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
}
