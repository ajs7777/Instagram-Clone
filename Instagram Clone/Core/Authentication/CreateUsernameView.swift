//
//  CreateUsernameView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @State var userName = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10.0) {
            Text("Create a username")
                .font(.title2)
                .fontWeight(.bold)
            Text("Pick a usrname for your new account, You can always change it later")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
                .font(.footnote)
            
            VStack(spacing: 25.0) {
                SecureField("Create a username", text: $userName)
                    .textInputAutocapitalization(.never)
                    .modifier(IGButtonStyleModifier())
                
                NavigationLink {
                    PasswordView()
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
        CreateUsernameView()
    }
}
