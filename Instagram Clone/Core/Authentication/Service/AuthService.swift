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
    
    func logIn(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Error creating user \(error.localizedDescription)")
        }
 
    }
    
    func loadUser() async throws {
        
    }
    
    func logout() {
        
    }
}
