//
//  ProfileHeader.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct ProfileHeader: View {
    var username: String
    var profileImage: Image
    var body: some View {
        HStack(spacing: 16) {
            profileImage
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
            VStack(alignment: .leading, spacing: 4) {
                Text(username)
                    .font(.headline)
                Text("I love dogs!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(username: "Max Diess",
                      profileImage: Image("dog"))
    }
}
