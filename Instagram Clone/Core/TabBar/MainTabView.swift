//
//  MainTabView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
                .toolbarBackground(.white, for: .tabBar)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .toolbarBackground(.white, for: .tabBar)
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                        .environment(\.symbolVariants, .none)
                }
            Text("inbox View")
                .tabItem {
                    Image(systemName: "heart")
                }

            CurrentUserProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
            
        } .tint(Color.black)
           
    }
}

#Preview {
    MainTabView()
}
