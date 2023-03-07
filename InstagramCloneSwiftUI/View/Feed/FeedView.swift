//
//  FeedView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
