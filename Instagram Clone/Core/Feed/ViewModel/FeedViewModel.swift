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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)} )
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerid = post.ownerid
            let postUser = try await UserService.fethcUser(withUid: ownerid)
            posts[i].user = postUser
        }
    }
}
