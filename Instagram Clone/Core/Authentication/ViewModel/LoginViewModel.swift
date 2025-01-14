//
//  LoginViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.logIn(email: email, password: password)
    }
    
}
