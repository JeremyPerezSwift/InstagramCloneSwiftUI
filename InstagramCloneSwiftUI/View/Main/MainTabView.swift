//
//  MainTabView.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @Binding var selectedIndex: Int
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "rectangle.grid.1x2")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(0)
                
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(1)
                
                UploadPostView(selectedIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(2)
                
                NotificationsView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(3)
                
               
                ProfileView(viewModel: ProfileViewModel(user: user))
                    .onTapGesture {
                        selectedIndex = 4
                        print("DEBUG: fetchUserPost Main")
                    }
                    .tabItem {
                        Image(systemName: "person")
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(4)
                
            }
            .navigationTitle(tabTitle)
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
    
    var tabTitle: String {
        switch selectedIndex {
            case 0: return "Feed"
            case 1: return "Explore"
            case 2: return "New Post"
            case 3: return "Notification"
            case 4: return "Profile"
            default: return ""
        }
    }
    
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
