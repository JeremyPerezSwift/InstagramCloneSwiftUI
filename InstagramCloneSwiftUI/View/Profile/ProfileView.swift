//
//  ProfileView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct ProfileView: View {
//    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
//    init(user: User) {
//        self.user = user
//        self.viewModel = ProfileViewModel(user: user)
//        print("DEBUG: fetchUserPost 00")
//    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView(viewModel: viewModel)
                
//                PostGridView(config: .profile(viewModel.user.id ?? ""))
                PostGridView(viewModel: PostGridViewModel(config: .profile(viewModel.user.id ?? "")), config: .profile(viewModel.user.id ?? ""))
            }
            .padding(.top)
        }
    }
}

