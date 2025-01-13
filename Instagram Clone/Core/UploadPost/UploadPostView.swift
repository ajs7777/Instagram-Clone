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
                    viewModel.postImage = nil
                    viewModel.selsectedImage = nil
                    tabIndex = 0
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
}

#Preview {
    UploadPostView( tabIndex: .constant(0))
}
