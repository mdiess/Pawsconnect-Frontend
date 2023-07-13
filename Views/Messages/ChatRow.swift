//
//  ChatRow.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct ChatRow: View {
    let username: String
    let message: String
    
    var body: some View {
        HStack {
            Image("dog")
                .resizable()
                .foregroundColor(Color.black)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(username)
                    .font(.headline)
                    .foregroundColor(Color.black)
                
                Text(message)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(username: "John Smith", message: "Nice cock, man")
    }
}
