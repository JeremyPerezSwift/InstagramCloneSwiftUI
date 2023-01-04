//
//  FeedCell.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("Batman")
                    .font(.system(size: 14, weight: .semibold))
                
            }
            .padding([.leading, .bottom], 8)
            
            Image("batman")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .clipped()
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .font(.system(size: 20))
                        .padding(4)
                }
                
                Button {
                    
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
            
            Text("4 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.horizontal, 8)
                .padding(.bottom, 1)
            
            HStack {
                Text("the batman")
                    .font(.system(size: 14, weight: .semibold)) + Text(" Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.")
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 8)
//            .padding(.bottom, 1)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -5)
            
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
