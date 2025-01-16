//
//  CircularProfileImageView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 16/01/25.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize : CGFloat {
    case xSmall
    case small
    case medium
    case large
    case XLarge
    
    var dimension : CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 60
        case .large:
            return 80
        case .XLarge:
            return 100
        }
    }
}

struct CircularProfileImageView: View {
    
    let user : User
    let size : ProfileImageSize
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .foregroundStyle(Color(.systemGray4))
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USER[0], size: .XLarge)
}
