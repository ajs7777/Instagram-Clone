//
//  UploadPostViewModel.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 13/01/25.
//

import Foundation
import PhotosUI
import SwiftUI

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
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data =  try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
}
