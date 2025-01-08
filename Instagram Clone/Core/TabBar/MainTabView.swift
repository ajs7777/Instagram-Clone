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
            Text("Feed View")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Explore View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("inbox View")
                .tabItem {
                    Image(systemName: "heart")
                }
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person")
                }
        } .tint(.black)
    }
}

#Preview {
    MainTabView()
}
