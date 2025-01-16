//
//  User.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var fullname: String?
    var profileImageUrl: String?
    var bio: String?
    let email: String
    
    var currentUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return id == currentUid
    }
    
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", fullname: "Bruce Wayne", profileImageUrl: nil, bio: "Save the Gotham City!", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", fullname: "Chadwick Boseman", profileImageUrl: nil, bio: "Wakanda Forever!", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", fullname: nil, profileImageUrl: nil, bio: "Love you 3000", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", fullname: "Eddie Brock", profileImageUrl: nil, bio: "We are the venom!", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", fullname: "Peter Parker", profileImageUrl: nil, bio: "Your friendly neignborhoood Spiderman", email: "spiderman@gmail.com")
    ]
}
