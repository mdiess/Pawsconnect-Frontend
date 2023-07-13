//
//  DiscoverView.swift
//  PawsConnect_2
//
//  Created by Max Diess on 7/10/23.
//

import SwiftUI

struct DiscoverView: View {
    let posts: [Post] = [
        Post(username: "john_doe", imageName: "dog"),
        Post(username: "jane_smith", imageName: "dog2"),
        Post(username: "alex_williams", imageName: "dog3"),
        // Add more posts here as needed
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(posts, id: \.username) { post in
                    PostView(post: post)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Post: Identifiable {
    let id = UUID()
    let username: String
    let imageName: String
}

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(12)
            
            Text(post.username)
                .font(.headline)
                .fontWeight(.bold)
            
            // Additional post content such as caption, likes, etc.
            // Add them here if needed
        }
        .padding(.vertical)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
