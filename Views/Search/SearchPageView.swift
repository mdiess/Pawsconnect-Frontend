//
//  SearchPageView.swift
//  PawsConnect_2
//
//  Created by Max Diess on 7/10/23.
//

import SwiftUI

struct SearchPageView: View {
    @State private var searchText = ""
    @State private var showSearchResults = false
    @State private var searchHistory: [String] = []
    @State private var showUserSuggestions = false // New state variable for user suggestions
    
    var body: some View {
        ZStack {
            Color("primary")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBarView(searchText: $searchText, showSearchResults: $showSearchResults, searchHistory: $searchHistory, showUserSuggestions: $showUserSuggestions) // Pass the new state variable
                
                if showSearchResults {
                    SearchResultListView(searchText: $searchText, searchHistory: $searchHistory)
                } else if showUserSuggestions { // Show user suggestions based on showUserSuggestions state variable
                    UserSuggestionsView()
                } else {
                    DiscoverView()
                }
            }
        }
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
