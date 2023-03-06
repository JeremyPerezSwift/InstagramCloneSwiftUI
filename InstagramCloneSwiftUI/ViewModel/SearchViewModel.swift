//
//  SearchViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by Jérémy Perez on 03/03/2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users: [User] = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            print("DEBUG: fetchUsers \(self.users.count)")
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
    
}
