//
//  ProfileHeaderView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .clipped()
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 12) {
                    UserStatView(value: 3, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 1, title: "Following")
                }
                .padding(.trailing)
            }
            
            VStack(alignment: .leading) {
                Text("Bruce Wayne")
                    .font(.system(size: 13, weight: .semibold))
                
                Text("Ghotam's Dark Knight || Billionaire")
                    .font(.system(size: 13))
                    .padding(.top, -5)
            }
            .padding(.leading)
            .padding(.top, 8)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }
            .padding(.top, 8)

            
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
