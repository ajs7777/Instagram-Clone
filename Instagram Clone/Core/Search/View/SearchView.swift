//
//  SearchView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 10/01/25.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText : String = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing : 12){
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack{
                                CircularProfileImageView(user: user, size: .xSmall)
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
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
