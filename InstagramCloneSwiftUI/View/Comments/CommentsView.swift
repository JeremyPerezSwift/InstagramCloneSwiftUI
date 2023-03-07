//
//  CommentsView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 07/03/2023.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: CommentViewModel
    @State var commentText: String = ""
    
    init(post: Post) {
        viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 25) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }.padding(.vertical)
            }
            
            CustomInputView(inputText: $commentText, action: uploadComment)
            
        }
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
    
}

