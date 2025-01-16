//
//  EditProfileViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 14/01/25.
//

import SwiftUI
import PhotosUI
import Firebase

class EditProfileViewModel: ObservableObject {
    
    @Published var user : User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task{
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data =  try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
