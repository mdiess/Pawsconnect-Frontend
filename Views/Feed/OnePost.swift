//
//  OnePost.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct OnePost: View {
    @State private var buttonClicked = false
    @State private var isCommentShown = false
    var profileImage: Image
    var postImage: Image
    var username: String
    var caption: String
    @State var likesCount: Int
    var commentsCount: Int
    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(username)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                eachImage(image: postImage)
                HStack {
                    Text(username)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text(caption)
                        .font(.body)
                        .lineLimit(nil)
                }
                HStack {
                    Button(action: {
                        buttonClicked.toggle()
                        if buttonClicked {
                            likesCount += 1
                        } else {
                            likesCount -= 1
                        }
                    }) {
                        if buttonClicked {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        } else {
                            Image(systemName: "heart")
                                .foregroundColor(.red)
                        }
                    }
                    Text("\(likesCount) likes")
                        .font(.subheadline)
                    Image(systemName: "message")
                        .foregroundColor(.black)
                        .onTapGesture {
                            isCommentShown = true
                        }
                        .sheet(isPresented: $isCommentShown) {
                            CommentSection(username: username, comment: caption, time: "10h", pfp: profileImage)
                        }
                    Text("\(commentsCount) comments")
                        .font(.subheadline)
                }
                
            }
            .padding()
        }
    }
}

struct OnePost_Previews: PreviewProvider {
    static var previews: some View {
        OnePost(profileImage: Image("paw-png"),
                 postImage: Image("golden_pups"),
                 username: "max_diess",
                 caption: "Beautiful day at the park!",
                 likesCount: 100,
                 commentsCount: 50)
    }
}
