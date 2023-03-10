//
//  ProfileActionButtonView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    @State var showEditProfile: Bool = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 13, weight: .semibold))
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 32)
                    .foregroundStyle(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            .sheet(isPresented: $showEditProfile) {
                EditProfilView(viewModel: viewModel)
            }
        } else {
            HStack {
                Button {
                    if isFollowed {
                        viewModel.unfollow()
                    } else {
                        viewModel.follow()
                    }
                } label: {
                    HStack {
                        Text(isFollowed ? "Following" : "Follow")
                            .font(.system(size: 13, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width / 2.2, height: 32)
                            .foregroundStyle(isFollowed ? .black : .white)
                            .background(isFollowed ? .white : Color(.systemBlue))
                            .overlay {
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: isFollowed ? 2 : 0)
                                    
                            }
                    }
                }
                .cornerRadius(3)
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Message")
                            .font(.system(size: 13, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width / 2.2, height: 32)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray, lineWidth: 1)
                            }
                    }
                }
            }
            
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
