//
//  PostGridViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 19/01/25.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user : User
    @Published var posts = [Post]()
    
    init(user : User){
        self.user = user
        
        Task{
            try await fetchUserPosts()
        }
    }
    
    func fetchUserPosts() async throws {
        posts = try await PostService.fetchUserPosts(uid: user.id)
    }
}
