//
//  ChatDetail.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct ChatDetail: View {
    @State private var messageText: String = ""
    var person: String
    @State var messages: [Message]
    init(person: String) {
        self.person = person
        _messages = State(initialValue: [
            Message(user: person, content: "Hey", isSentByCurrentUser: true),
            Message(user: person, content: "Where is my money??", isSentByCurrentUser: false),
            Message(user: person, content: "I'll have it soon. I promise.", isSentByCurrentUser: true),
            Message(user: person, content: "You got 10 hours...", isSentByCurrentUser: false)
        ])
    }
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            ChatBubble(isCurrentUser: message.isSentByCurrentUser, message: message.content)
                        }
                    }
                    .padding()
                }
                
                HStack {
                    TextField("Type a message", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        // Send message action
                        sendMessage()
                    }) {
                        Text("Send")
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .navigationBarTitle(person)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else {
            return        }
        messages.append(Message(user:"", content: messageText, isSentByCurrentUser: true))
        messageText = ""
    }
}

struct ChatDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetail(person: "John Doe")
    }
}
