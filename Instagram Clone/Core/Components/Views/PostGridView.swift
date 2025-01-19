//
//  PostGridView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    @State var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    let imageScale : CGFloat = (UIScreen.main.bounds.width / 3 ) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageurl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageScale, height: imageScale)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USER[0])
}
