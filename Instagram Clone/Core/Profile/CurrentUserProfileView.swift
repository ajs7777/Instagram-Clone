//
//  CurrentUserProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
   
    let user : User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProofileHeaderView(user: user)
                Divider()
                PostGridView(user: user)
            } .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
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
