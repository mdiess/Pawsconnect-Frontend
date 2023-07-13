//
//  SearchBarView.swift
//  PawsConnect_2
//
//  Created by Max Diess on 7/10/23.
//

import SwiftUI


struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var showSearchResults: Bool
    @Binding var searchHistory: [String]
    @Binding var showUserSuggestions: Bool // New binding for user suggestions visibility
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: searchText) { newValue in
                        showUserSuggestions = !newValue.isEmpty // Show user suggestions if there's input
                    }
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                        showSearchResults = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .transition(.move(edge: .trailing))
                }
            }
            .padding()
            
            if showSearchResults && !searchText.isEmpty {
                Button(action: {
                    showSearchResults = false
                    saveSearchHistory()
                }) {
                    Text("Back to Discover")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private func saveSearchHistory() {
        if !searchHistory.contains(searchText) {
            searchHistory.insert(searchText, at: 0)
        }
    }
}

//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView(searchText: "", showSearchResults: true)
//    }
//}
