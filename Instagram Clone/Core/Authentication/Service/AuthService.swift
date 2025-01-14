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
    
    @Published var currentUser : User?
    @Published var userSession : FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        Task{ try await loadUserData() }
    }
    
    @MainActor
    func logIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
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
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func logout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    func uploadUserData(uid : String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        currentUser = user
        guard let encodedData = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedData)
    }
}
