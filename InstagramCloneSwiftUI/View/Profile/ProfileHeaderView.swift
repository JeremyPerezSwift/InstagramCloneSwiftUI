//
//  ProfileHeaderView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var buiUser: String { return viewModel.user.bio ?? "Add bio" }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipped()
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 12) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Post")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }
                .padding(.trailing)
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.user.fullname)
                    .font(.system(size: 13, weight: .semibold))
                
                Text(buiUser)
                    .font(.system(size: 13))
                    .padding(.top, -5)
            }
            .padding(.leading)
            .padding(.top, 8)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }
            .padding(.top, 8)

            
        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
