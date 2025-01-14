//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct ProfileView: View {
        
    let user : User
    var posts : [Post] {
        return Post.MOCK_POST.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        
        ScrollView {
            ProofileHeaderView(user: user)
            Divider()
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ProfileView( user: User.MOCK_USER[0])
    
}
