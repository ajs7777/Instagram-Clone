//
//  EditProfileView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : EditProfileViewModel
    
    init(user : User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            
                    }
                    Spacer()
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        Task{
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                            .fontWeight(.bold)
                    }
                } .padding(.horizontal)
                Divider()
                
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack{
                        VStack{
                            CircularProfileImageView(user: viewModel.user, size: .large)
                        } .overlay(alignment: .bottomTrailing) {
                            Image(systemName: "camera.fill")
                                .foregroundStyle(.gray)
                                .padding(3)
                        }
                        Text("Edit Profile Picture")
                    } .padding(.vertical, 8)
                }
                Divider()
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USER[0])
}

struct EditProfileRowView : View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text(title)
                .frame(width: 60, alignment: .leading)
            VStack(alignment: .leading) {
                TextField(placeholder, text: $text)
                Divider()
            }
        } .padding(.horizontal)
            .padding(.top, 5)
    }
}
