//
//  PasswordView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct PasswordView: View {
    
    @State var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
            Text("Your password must be at least 6 characters long")
                .foregroundStyle(.gray)
                .font(.footnote)
            
            VStack(spacing: 25.0) {
                SecureField("Create a password", text: $password)
                    .textInputAutocapitalization(.never)
                    .modifier(IGButtonStyleModifier())
                
                Button {
                    print("Go to login")
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
        PasswordView()
    }
}
