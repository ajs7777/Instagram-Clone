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
                if let image = viewModel.profileIMage {
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
    UploadPostView()
}
