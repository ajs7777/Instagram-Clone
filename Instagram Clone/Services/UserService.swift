//
//  UserService.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import Foundation
import Firebase

class UserService: ObservableObject {
    
    static func fethcUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
