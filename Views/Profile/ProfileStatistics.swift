//
//  ProfileStatistics.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct ProfileStatistics: View {
    var body: some View {
        HStack(spacing: 80) {
            VStack(alignment: .center, spacing: 4) {
                Text("1234")
                    .font(.headline)
                
                Text("Posts")
                    .font(.caption)
            }
            VStack(alignment: .center, spacing: 4) {
                Text("5678")
                    .font(.headline)
                
                Text("Followers")
                    .font(.caption)
            }
            VStack(alignment: .center, spacing: 4) {
                Text("9012")
                    .font(.headline)
                
                Text("Following")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

struct ProfileStatistics_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStatistics()
    }
}
