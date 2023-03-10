//
//  User.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 02/03/2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageURL: String
    let fullname: String
    var bio: String?
    @DocumentID var id: String?
    var isFollowed: Bool? = false
    
    var stats: UserStats?
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
