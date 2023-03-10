//
//  NotificationCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    @State private var showPostImage = true
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(notification: Notification) {
        viewModel = NotificationCellViewModel(notification: notification)
    }
    
    var body: some View {
        HStack {
            NavigationLink {
                if let user = viewModel.notification.user {
                    ProfileView(viewModel: ProfileViewModel(user: user))
                }
            } label: {
                KFImage(URL(string: viewModel.notification.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                    .clipShape(Circle())
                
                Text(viewModel.notification.username)
                    .font(.system(size: 13, weight: .semibold)) + Text(" \(viewModel.notification.type.notificationMessage)  ").font(.system(size: 14)) + Text(viewModel.timestampString).font(.system(size: 12)).foregroundColor(.gray)
            }

            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink {
                        VStack {
                            FeedCell(viewModel: FeedCellViewModel(post: post))
                                .padding(.top)
                            
                            Spacer()
                        }
                    } label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }

                }
            } else {
                Button {
                    if isFollowed {
                        viewModel.unfollow()
                    } else {
                        viewModel.follow()
                    }
                } label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 13, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width / 4, height: 32)
                        .foregroundStyle(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : Color(.systemBlue))
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 2 : 0)
                                
                        }
                }
                .cornerRadius(3)
            }
            
        }
    }
}

