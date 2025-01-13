//
//  ContentView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession == nil {
            LoginView()
        } else {
            MainTabView()
        }
    }
}

#Preview {
    ContentView()
}
