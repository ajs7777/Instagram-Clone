//
//  ProofileHeaderView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct ProofileHeaderView: View {
    
    let user : User
    @State var showEditProfileView : Bool = false
    
    var body: some View {
        VStack{
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
                if let fullName = user.fullname {
                    Text(fullName)
                        .fontWeight(.bold)
                        .font(.subheadline)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                Text(user.username)
            } .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Button {
                if user.currentUser {
                    showEditProfileView.toggle()
                } else {
                    print("Follow")
                }
            } label: {
                Text(user.currentUser ? "Edit Profile" : "Follow")
                    .foregroundStyle(user.currentUser ? .black : .white)
                    .fontWeight(.regular)
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .background(user.currentUser ? Color.clear : Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 6 ))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(user.currentUser ? Color.gray : Color.white, lineWidth: 1)
                    }
                    .padding()
            }
        }
        .fullScreenCover(isPresented: $showEditProfileView) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProofileHeaderView(user: User.MOCK_USER[0])
}
