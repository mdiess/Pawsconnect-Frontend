//
//  ParkSearch.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import MapKit

struct ParkSearch: UIViewRepresentable {
    @Binding var text: String
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search Pet-Friendly Parks"
        searchBar.backgroundColor = UIColor(Color("primary"))
        searchBar.backgroundImage = UIImage()
        if let searchField = searchBar.value(forKey: "searchField") as? UITextField {
            searchField.backgroundColor = UIColor(Color("receiver"))
        }
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

//struct ParkSearch_Previews: PreviewProvider {
//    static var previews: some View {
//        ParkSearch(text: "park")
//    }
//}
