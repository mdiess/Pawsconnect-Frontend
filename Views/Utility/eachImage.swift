//
//  eachImage.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI

struct eachImage: View {
    var image: Image
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 300)
                .cornerRadius(2)
        }
        .frame(maxHeight:300)
    }
}

struct eachImage_Previews: PreviewProvider {
    static var previews: some View {
        eachImage(image: Image("dog"))
    }
}
