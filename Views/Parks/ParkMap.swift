//
//  ParkMap.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import MapKit

struct Park: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ParkMap: View {
    @State private var parks: [Park] = [
        Park(name: "Central Park", coordinate: CLLocationCoordinate2D(latitude: 40.7829, longitude: -73.9654)),
        Park(name: "Golden Gate Park", coordinate: CLLocationCoordinate2D(latitude: 37.7694, longitude: -122.4862)),
        Park(name: "Griffith Park", coordinate: CLLocationCoordinate2D(latitude: 34.1367, longitude: -118.2946))
    ]
    @State private var searchQuery: String = ""
    var body: some View {
        VStack {
            ParkMapGPS(parks: filteredParks)
                .ignoresSafeArea()
            ParkSearch(text: $searchQuery)
        }
        .background(Color("primary"))
    }
    private var filteredParks: [Park] {
        if searchQuery.isEmpty {
            return parks
        } else {
            return parks.filter { $0.name.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
}

struct ParkMap_Previews: PreviewProvider {
    static var previews: some View {
        ParkMap()
    }
}
