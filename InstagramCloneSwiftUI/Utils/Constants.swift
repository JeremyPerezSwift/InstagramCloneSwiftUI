//
//  Constants.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 02/03/2023.
//

import Firebase
import FirebaseFirestore

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
