//
//  ProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            HStack{
                Image("black-panther-1")
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
                Text("Chadwick Boseman")
                    .fontWeight(.bold)
                    .font(.footnote)
                Text("Wakanda Forever")
                    .font(.footnote)
            } .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .font(.body)
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 2)
                        }
                        .padding()
                }
            }
            Divider()
            
            LazyVGrid(columns: gridItems, spacing: 2) {
                ForEach(0..<10, id: \.self) { post in
                   Image("black-panther-2")
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
