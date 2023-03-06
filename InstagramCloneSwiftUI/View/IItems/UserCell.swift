//
//  UserCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 20/01/2023.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .background(.gray.opacity(0.3))
                .clipped()
                .clipShape(Circle())
            
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

