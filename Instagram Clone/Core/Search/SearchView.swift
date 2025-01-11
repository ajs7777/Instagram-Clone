//
//  SearchView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 10/01/25.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText : String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing : 12){
                    ForEach(User.MOCK_USER) { user in
                        NavigationLink(value: user) {
                            HStack{
                                Image(user.profileImageUrl ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullName {
                                        Text(fullname)
                                    }
                                } .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search...")
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
