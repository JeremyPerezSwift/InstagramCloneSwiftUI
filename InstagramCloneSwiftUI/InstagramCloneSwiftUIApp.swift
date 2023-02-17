//
//  InstagramCloneSwiftUIApp.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 04/01/2023.
//

import SwiftUI
import Firebase

@main
struct InstagramCloneSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
