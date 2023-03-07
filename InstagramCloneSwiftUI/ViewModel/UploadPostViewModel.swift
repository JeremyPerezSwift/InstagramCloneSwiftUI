//
//  UploadPostViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 06/03/2023.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption, "timestamp": Timestamp(date: Date()), "likes": 0, "imageUrl": imageUrl, "ownerUid": user.id ?? "", "ownerImageUrl": user.profileImageURL, "ownerUsername": user.username]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
        }
    }
    
}
