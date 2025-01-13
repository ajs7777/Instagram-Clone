//
//  AuthService.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import FirebaseAuth

class AuthService: ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func logIn(email: String, password: String) {
        
    }
    
    func createUser(email: String, password: String, username: String) {
        
    }
    
    func loadUser() {
        
    }
    
    func logout() {
        
    }
}
