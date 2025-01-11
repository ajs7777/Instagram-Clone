//
//  LoginView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 11/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("Instagram-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 80)
                VStack(spacing: 10.0){
                    TextField("Enter you email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(IGButtonStyleModifier())
                    SecureField("Enter your password", text: $password)
                        .modifier(IGButtonStyleModifier())
                }
                
                Button {
                    print("foprgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    print("login")
                } label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 42)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                }
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 1)
                        .opacity(0.5)
                    Text("OR")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 1)
                        .opacity(0.5)
                } .foregroundStyle(.gray)
                    .padding(.vertical)
                
                Button {
                    
                } label: {
                    HStack(spacing: 0.0){
                        Image("facebook-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Text("Continue with Facebook")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                    }
                }
                Spacer()
                Divider()
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.blue)
                    .font(.subheadline)
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
