//
//  MainTabView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                
                FeedView()
                    .tabItem {
                        Image(systemName: "rectangle.grid.1x2")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .environment(\.symbolVariants, .none)
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                    }
                
                UploadPostView()
                    .tabItem {
                        Image(systemName: "plus.square")
                            .environment(\.symbolVariants, .none)
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, .none)
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, .none)
                    }
                
                
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    logoutButton
                }
            }
            .tint(.black)
        }
        
    }
    
    var logoutButton: some View {
        Button {
            AuthViewModel.shared.signout()
        } label: {
            Text("Logout")
                .foregroundColor(.black)
                .bold()
        }

    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
