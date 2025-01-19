//
//  PostService.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 19/01/25.
//

import Foundation
import Firebase


struct PostService {
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)} )
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerid = post.ownerid
            let postUser = try await UserService.fethcUser(withUid: ownerid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").whereField("ownerid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)} )
    }
}
