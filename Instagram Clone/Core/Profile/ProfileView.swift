//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct ProfileView: View {
        
    let user : User
    
    var body: some View {
        
        ScrollView {
            ProofileHeaderView(user: user)
            Divider()
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ProfileView( user: User.MOCK_USER[0])
    
}
