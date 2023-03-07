//
//  AuthViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 17/02/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login Error \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                print("DEBUG: Login Successfully")
                self.userSession = user
                self.fetchUser()
            }
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage, username: String, fullname: String) {
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageURL in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG: Register Error \(error.localizedDescription)")
                    return
                } else {
                    guard let user = result?.user else { return }
                    print("DEBUG: Register Successfully")
                    
                    let data = ["email": email, "username": username, "fullname": fullname, "profileImageURL": imageURL, "uid": user.uid]
                    
                    COLLECTION_USERS.document(user.uid).setData(data) { errorFirestore in
                        if let errorFirestore = errorFirestore {
                            print("DEBUG: Uploaded user data Error \(errorFirestore.localizedDescription)")
                            return
                        } else {
                            print("DEBUG: Uploaded user data Successfully")
                            self.userSession = user
                            self.fetchUser()
                        }
                        
                    }
                    
                    
                }
            }
        }
        
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
    
}
