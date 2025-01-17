//
//  Post.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import Foundation
import Firebase

struct Post : Identifiable, Codable {
    let id : String
    let ownerid : String
    var likes : Int
    let caption : String
    let imageurl : String
    let timeStamp : Timestamp
    var user : User?
    
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerid: NSUUID().uuidString,
            likes: 215,
            caption: "This is some test captions for now",
            imageurl: "batman-2",
            timeStamp: Timestamp(),
            user: User.MOCK_USER[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerid: NSUUID().uuidString,
            likes: 654,
            caption: "This is some test captions for now",
            imageurl: "black-panther-2",
            timeStamp: Timestamp(),
            user: User.MOCK_USER[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerid: NSUUID().uuidString,
            likes: 3000,
            caption: "This is some test captions for now",
            imageurl: "ironman-2",
            timeStamp: Timestamp(),
            user: User.MOCK_USER[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerid: NSUUID().uuidString,
            likes: 223,
            caption: "This is some test captions for now",
            imageurl: "venom-2",
            timeStamp: Timestamp(),
            user: User.MOCK_USER[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerid: NSUUID().uuidString,
            likes: 415,
            caption: "This is some test captions for now",
            imageurl: "spiderman-2",
            timeStamp: Timestamp(),
            user: User.MOCK_USER[4]
        ),
    ]
}
