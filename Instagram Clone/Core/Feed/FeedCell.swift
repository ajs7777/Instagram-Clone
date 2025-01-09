//
//  FeedCell.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 09/01/25.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //header
            HStack{
                Image("batman-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text("batman")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                
                Image(systemName: "ellipsis")
            } .padding(.horizontal, 10)
            //Post
            Image("batman-1")
                .resizable()
                .scaledToFill()
                .frame(width: 410, height: 410)
                .clipShape(Rectangle())
            // buttons
            HStack(spacing: 10.0){
                Button {
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Button {
                    print("Comment Post")
                } label: {
                    Image(systemName: "bubble")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Button {
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                Button {
                    print("Save Post")
                } label: {
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 18, height: 22)
                        .foregroundStyle(.black)
                }
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 6)
            
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 2)
            HStack {
                Text("batman").font(.footnote).fontWeight(.semibold) +
                Text("This is some test caption for now this is some test caption")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 12)
            .padding(.top, 2)
            
            Text("6h ago")
                .font(.caption)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .padding(.top, 1)
        }
    }
}

#Preview {
    FeedCell()
}
