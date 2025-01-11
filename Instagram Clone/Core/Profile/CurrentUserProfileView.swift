//
//  CurrentUserProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let imageScale : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1
    
    let user : User
    
    var posts : [Post] {
        return Post.MOCK_POST.filter { $0.user?.username == user.username }
    }
    
    var body: some View {
        NavigationStack {
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
                    Text(user.fullName ?? "")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    Text(user.bio ?? "")
                        .font(.footnote)
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
                
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(posts) { post in
                        Image(post.imageurl )
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageScale, height: imageScale)
                            .clipShape(Rectangle())
                    }
                }
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
