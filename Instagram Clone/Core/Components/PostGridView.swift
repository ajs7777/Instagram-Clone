//
//  PostGridView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct PostGridView: View {
    
    @State var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    let posts : [Post]
    
    let imageScale : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts) { post in
                Image(post.imageurl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageScale, height: imageScale)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POST)
}
