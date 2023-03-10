//
//  PostGridView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 20/01/2023.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @ObservedObject var viewModel: PostGridViewModel
    let config: PostGridConfiguration
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
//    init(config: PostGridConfiguration) {
//        self.config = config
//        self.viewModel = PostGridViewModel(config: config)
//        print("DEBUG: fetchUserPost 0")
//    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) { post in
                
                NavigationLink {
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                        .background(.gray)
                }
            }
            
        }
    }
}

//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
