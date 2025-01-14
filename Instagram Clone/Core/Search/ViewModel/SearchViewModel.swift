//
//  SearchViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
