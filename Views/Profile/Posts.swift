//
//  Posts.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct Posts: View {
    let posts: [Int] = Array(1...4)
    var username: String
    var profileImage: Image
    var body: some View {
        let chunkedPosts = posts.chunked(into: 3)
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(chunkedPosts, id: \.self) { rowPosts in
                    HStack(spacing: 8) {
                        ForEach(rowPosts, id: \.self) { postIndex in
                            NavigationLink(destination: FullScreenPost(postIndex: postIndex, profileImage: profileImage, username: username, caption: "This is such a beautiful day", likesCount: 129, commentsCount: 13)) {
                                PostItem(postIndex: postIndex)
                                    .frame(maxWidth: UIScreen.main.bounds.width / 3 - 20)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

struct Posts_Previews: PreviewProvider {
    static var previews: some View {
        Posts(username: "Max Diess",
              profileImage: Image("dog"))
    }
}
