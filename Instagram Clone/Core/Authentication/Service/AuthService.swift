//
//  AuthService.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthService: ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func logIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
        } catch {
            print("DEBUG: Error Log in user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Error creating user \(error.localizedDescription)")
        }
 
    }
    
    func loadUser() async throws {
        
    }
    
    func logout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    func uploadUserData(uid : String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedData = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedData)
    }
}
