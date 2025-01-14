//
//  User.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var fullname: String?
    var profileImageUrl: String?
    var bio: String?
    let email: String
    
    static var MOCK_USER: [User] = [
        .init(id: NSUUID().uuidString, username: "batman", fullname: "Bruce Wayne", profileImageUrl: "batman-1", bio: "Save the Gotham City!", email: "batman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "blackpanther", fullname: "Chadwick Boseman", profileImageUrl: "black-panther-1", bio: "Wakanda Forever!", email: "blackpanther@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ironman", fullname: nil, profileImageUrl: "ironman-1", bio: "Love you 3000", email: "ironman@gmail.com"),
        .init(id: NSUUID().uuidString, username: "venom", fullname: "Eddie Brock", profileImageUrl: "venom-1", bio: "We are the venom!", email: "venom@gmail.com"),
        .init(id: NSUUID().uuidString, username: "spiderman", fullname: "Peter Parker", profileImageUrl: "spiderman-1", bio: "Your friendly neignborhoood Spiderman", email: "spiderman@gmail.com")
    ]
}
