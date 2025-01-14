//
//  MainTabView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab: Int = 0
    var user : User
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .onAppear{
                    selectedTab = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .toolbarBackground(.white, for: .tabBar)
                .tag(0)
            SearchView()
                .onAppear{
                    selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .toolbarBackground(.white, for: .tabBar)
                .tag(1)
            UploadPostView( tabIndex: $selectedTab)
                .onAppear{
                    selectedTab = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                        .environment(\.symbolVariants, .none)
                }
                .tag(2)
            Text("inbox View")
                .onAppear{
                    selectedTab = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(3)
            CurrentUserProfileView(user: user)
                .onAppear{
                    selectedTab = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
            
        } .tint(Color.black)
        
    }
}

#Preview {
    MainTabView( user: User.MOCK_USER[0])
}
