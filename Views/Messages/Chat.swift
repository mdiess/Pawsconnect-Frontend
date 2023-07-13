//
//  Chat.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct Chat: View {
    var messages: [Message] = [
        Message(user:"Damian Lillard", content: "Hey whats up", isSentByCurrentUser: true),
        Message(user:"Daniel Larson", content: "Good to talk to you", isSentByCurrentUser: false),
        Message(user:"Jack Bauer", content: "You got 10 hours...", isSentByCurrentUser: true),
        Message(user:"Margot Robbie", content: "Hey there ;)", isSentByCurrentUser: false)
    ]
    var body: some View {
        NavigationView {
            ZStack {
                Color("primary")
                    .ignoresSafeArea()
                VStack {
                    Text("Direct Messages")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    Divider()
                    ForEach(messages) { message in
                        NavigationLink(destination: ChatDetail(person: message.user)) {
                            ChatRow(username: message.user, message: message.content)
                        }
                        Divider()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Message: Identifiable {
    let id = UUID()
    let user: String
    let content: String
    let isSentByCurrentUser: Bool
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
