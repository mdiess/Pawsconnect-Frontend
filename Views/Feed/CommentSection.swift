//
//  CommentSection.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import CoreData

struct CommentSection: View {
    var username: String
    var comment: String
    var time: String
    var pfp: Image
    @State private var newComment: String = ""
    @State private var newTime = 0
    @State private var comments: [Comment] = [
        Comment(username: "User 1", comment: "This is comment 1", time: "1h", pfp: Image(systemName: "person.crop.circle")),
        Comment(username: "User 2", comment: "This is comment 2", time: "2h", pfp: Image(systemName: "person.crop.circle")),
        Comment(username: "User 3", comment: "This is comment 3", time: "3h", pfp: Image(systemName: "person.crop.circle"))
    ]
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Comments")
                    .font(.headline)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        CommentRow(comment: Comment(username: username, comment: comment, time: time, pfp: pfp))
                        ForEach(comments) { comment in
                            CommentRow(comment: comment)
                        }
                    }
                }
                Divider()
                HStack {
                    TextField("Add a comment", text: $newComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 40)
                    
                    Button(action: {
                        postComment()
                    }) {
                        Text("Post")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
        }
    }
    private func generateRandomNumber() {
        let min = 1
        let max = 12
        newTime = Int.random(in: min...max)
    }
    private func postComment() {
        guard !newComment.isEmpty else {
            return
        }
        generateRandomNumber()
        let comment = Comment(username: "User", comment: newComment, time: "\(String(newTime))h", pfp: Image(systemName: "person.crop.circle"))
        comments.append(comment)
        newComment = ""
        newTime = 0
    }
}

struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let comment: String
    let time: String
    let pfp: Image
}

struct CommentSection_Previews: PreviewProvider {
    static var previews: some View {
        CommentSection(username: "max_diess",
                        comment: "A beautiful day at the park!",
                        time: "12h",
                        pfp: Image("dog"))
    }
}

struct CommentRow: View {
    var comment: Comment
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 8) {
                comment.pfp
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .font(.system(size: 30))
                VStack(alignment: .leading, spacing: 4) {
                    Text(comment.username)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(comment.comment)
                        .font(.body)
                }
                Spacer()
                Text(comment.time)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            Divider()
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: Comment(username: "User 1", comment: "This is comment 1", time: "1h", pfp: Image("dog")))
    }
}

