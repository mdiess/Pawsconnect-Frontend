//
//  AllPosts.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct AllPosts: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(1...20, id: \.self) { postIndex in
                    PostItem(postIndex: postIndex)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Posts")
    }
}

struct AllPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllPosts()
    }
}
