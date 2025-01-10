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
                    ForEach(0 ... 10, id: \.self) { user in
                        HStack{
                            Image("batman-1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("batman")
                                    .fontWeight(.semibold)
                                Text("Bruce Wayne")
                            } .font(.footnote)
                            
                            Spacer()
                        } .padding(.horizontal)
                    }
                    .searchable(text: $searchText, prompt: "Search...")
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
