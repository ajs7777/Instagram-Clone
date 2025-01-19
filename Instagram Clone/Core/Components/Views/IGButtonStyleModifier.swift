//
//  IGButtonStyleModifier.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct IGButtonStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(10)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
    }
}
