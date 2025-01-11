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
            HStack{
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 30.0){
                    UserStatsView(title: "Posts", value: 3)
                    UserStatsView(title: "Followers", value: 20)
                    UserStatsView(title: "Following", value: 50)
                }
            } .padding(.horizontal)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 4.0) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .fontWeight(.bold)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            } .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .foregroundStyle(.black)
                    .fontWeight(.regular)
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    .padding()
            }
            
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
