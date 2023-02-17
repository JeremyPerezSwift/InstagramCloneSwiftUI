//
//  PostGridView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 20/01/2023.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<7) { _ in
                
                NavigationLink {
                    FeedView()
                } label: {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
