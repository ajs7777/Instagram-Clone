//
//  UploadPostView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 12/01/25.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State var caption = ""
    @State var imagePickerIsPresented: Bool = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    upoloadPostAndBackToFeed()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    Task{
                        try await viewModel.uploadPost(caption: caption)
                        upoloadPostAndBackToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }

            } .padding(.horizontal)
            
            HStack{
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            } .padding()
            Spacer()
        }
        .onAppear{
            imagePickerIsPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerIsPresented, selection: $viewModel.selsectedImage)
    }
    
    func upoloadPostAndBackToFeed() {
        viewModel.postImage = nil
        viewModel.selsectedImage = nil
        caption = ""
        tabIndex = 0
    }
}

#Preview {
    UploadPostView( tabIndex: .constant(0))
}
