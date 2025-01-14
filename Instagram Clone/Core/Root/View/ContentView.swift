//
//  ContentView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
                .environmentObject(registrationViewModel)
        } else if let currentUser  = viewModel.currentUser {
            MainTabView(user: currentUser)
        }
    }
}

#Preview {
    ContentView()
}
