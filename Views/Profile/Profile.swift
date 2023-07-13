//
//  Profile.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct Profile: View {
    var username: String
    var profileImage: Image
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    ProfileHeader(username: username, profileImage: profileImage)
                    Divider()
                    ProfileStatistics()
                    Divider()
                    Button(action: {}) {
                        Text("Edit Profile")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.primary, lineWidth: 1)
                            )
                    }
                    .padding(.vertical, 12)
                    Divider()
                        .padding(.bottom)
                    Posts(username: username, profileImage: profileImage)
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(username: "Max Diess",
                profileImage: Image("dog"))
    }
}
