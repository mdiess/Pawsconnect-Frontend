//
//  PostItem.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct PostItem: View {
    let postIndex: Int
    var body: some View {
        Image("dog\(postIndex)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.width / 3 - 16)
            .clipped()
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem(postIndex: 1)
    }
}
