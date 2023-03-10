//
//  FeedCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
//    let post: Post
    @ObservedObject var viewModel: FeedCellViewModel
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavigationLink {
                    if let user = viewModel.post.user {
                        ProfileView(viewModel: ProfileViewModel(user: user))
                    }
                } label: {
                    KFImage(URL(string: viewModel.post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text(viewModel.post.ownerUsername)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 300)
//                .frame(maxHeight: 400)
                .clipped()
            
            HStack(spacing: 16) {
                Button {
                    if didLike {
                        viewModel.unlike()
                    } else {
                        viewModel.like()
                    }
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 18, height: 18)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                NavigationLink {
                    CommentsView(post: viewModel.post)
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .font(.system(size: 20))
                        .padding(4)
                }

                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .font(.system(size: 20))
                        .padding(4)
                }

            }
            .foregroundColor(.black)
            .padding(.leading, 4)
            
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 8)
                .padding(.bottom, 1)
            
            HStack {
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
//            .padding(.bottom, 1)
            
            Text(viewModel.timestampString)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -5)
            
        }
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
