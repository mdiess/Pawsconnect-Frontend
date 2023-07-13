//
//  SearchResultListView.swift
//  PawsConnect_2
//
//  Created by Max Diess on 7/10/23.
//

import SwiftUI

struct SearchResultListView: View {
    @Binding var searchText: String
    @Binding var searchHistory: [String]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(searchHistory, id: \.self) { historyItem in
                    Text(historyItem)
                        .padding()
                }
            }
            
            Spacer()
            
            Button(action: {
                searchHistory.removeAll()
            }) {
                Text("Clear Search History")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
}

//struct SearchResultListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultListView()
//    }
//}
