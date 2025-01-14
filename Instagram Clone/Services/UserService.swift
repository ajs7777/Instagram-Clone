//
//  UserService.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import Foundation
import Firebase

class UserService: ObservableObject {
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
