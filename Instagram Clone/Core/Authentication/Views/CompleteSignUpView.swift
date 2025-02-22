//
//  CompleteSignUpView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel : RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 10.0) {
            Spacer()
            VStack(spacing: 0) {
                Text("Welcome to Instagram, \(viewModel.username)")
                    .font(.title2)
                    .fontWeight(.bold)
               
            }
            Text("Click below to complte registration and start using Instagram")
                .foregroundStyle(.gray)
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25.0) {
                Button {
                    Task {
                        try await viewModel.createUser()
                    }
                } label: {
                    Text("Complete Sign Up")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 42)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                }
            } .padding(.top)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        CompleteSignUpView()
    }
}
