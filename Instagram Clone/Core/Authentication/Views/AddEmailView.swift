//
//  AddEmailView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct AddEmailView: View {
    
    @EnvironmentObject var viewModel : RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
            Text("You'll use this eamil to sign in to you account")
                .foregroundStyle(.gray)
                .font(.footnote)
            
            VStack(spacing: 25.0) {
                TextField("Enter you email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(IGButtonStyleModifier())
                
                NavigationLink {
                    CreateUsernameView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Next")
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
        AddEmailView()
    }
}
