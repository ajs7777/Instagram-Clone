//
//  UserStatsView.swift
//  Instagram Clone
//
//  Created by Abhijit Saha on 08/01/25.
//

import SwiftUI

struct UserStatsView: View {
    @State var title : String
    @State var value : Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.headline)
                .fontWeight(.semibold)
            Text(title)
                .font(.subheadline)
        }
    }
}

#Preview {
    UserStatsView(title:"Posts", value: 12)
}
