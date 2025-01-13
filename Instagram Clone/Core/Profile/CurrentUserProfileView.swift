//
//  CurrentUserProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
   
    let user : User
    var posts : [Post] {
        return Post.MOCK_POST.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProofileHeaderView(user: user)
                Divider()
                PostGridView( posts: posts)
            } .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            AuthService.shared.logout()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        }

                       
                    }
                }
        }
        
    }
}

#Preview {
    CurrentUserProfileView( user: User.MOCK_USER[4])
}
