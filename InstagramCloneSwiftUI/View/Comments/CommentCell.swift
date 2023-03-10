//
//  CommentCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .clipped()
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) + Text(" \(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            Text("\(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }
        .padding(.horizontal)
    }
}

