//
//  FeedViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 18/01/25.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        Task{ try await fetchPosts()}
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts =  try await PostService.fetchFeedPosts()
    }
}
