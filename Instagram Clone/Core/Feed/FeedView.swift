//
//  FeedView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 09/01/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) { post in
                        FeedCell()
                            .padding(.top)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .bold()
                        .imageScale(.large)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Image("Instagram-1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 40)
                }
            }
        } 
    }
}

#Preview {
    FeedView()
}
