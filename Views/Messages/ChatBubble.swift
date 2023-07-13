//
//  ChatBubble.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct ChatBubble: View {
    let isCurrentUser: Bool
    let message: String
    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }
            Text(message)
                .padding()
                .foregroundColor(.black)
                .background(isCurrentUser ? Color("sender") : Color("receiver"))
                .cornerRadius(10)
            if !isCurrentUser {
                Spacer()
            }
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isCurrentUser: true, message: "nice cock, man")
    }
}
