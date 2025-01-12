//
//  UploadPostView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 12/01/25.
//

import SwiftUI

struct UploadPostView: View {
    
    @State var caption = ""
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

            } .padding(.horizontal)
            
            HStack{
                Image("batman-2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            } .padding()
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
