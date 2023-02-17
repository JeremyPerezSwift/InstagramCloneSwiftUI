//
//  NotificationCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 21/01/2023.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipped()
                .clipShape(Circle())
            
            Text("the batman")
                .font(.system(size: 13, weight: .semibold)) + Text(" liked one of your pots")
                .font(.system(size: 14))
            
            Spacer()
            
            if showPostImage {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
            } else {
                Button {
                    
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .font(.system(size: 12).bold())
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }

            }
            
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
