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
    @State var selectedImage: PhotosPickerItem?
    @State var fullname: String = ""
    @State var bio: String = ""
    
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
                        
                    } label: {
                        Text("Done")
                            .fontWeight(.bold)
                    }
                } .padding(.horizontal)
                Divider()
                
                PhotosPicker(selection: $selectedImage) {
                    VStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(Color(.systemGray5))
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Text("Edit Profile Picture")
                    } .padding(.vertical, 8)
                }
                Divider()
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $bio)
            }
            Spacer()
        }
    }
}

#Preview {
    EditProfileView()
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
