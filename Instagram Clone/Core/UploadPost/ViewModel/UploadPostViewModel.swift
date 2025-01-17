//
//  UploadPostViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
import FirebaseAuth

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selsectedImage: PhotosPickerItem? {
        didSet {
            Task{
                await loadImage(fromItem: selsectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    private var uiImage : UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data =  try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerid: uid, likes: 0, caption: caption, imageurl: imageUrl, timeStamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
