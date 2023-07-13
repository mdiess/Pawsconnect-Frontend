//
//  ParkMapGPS.swift
//  PawsConnect_2
//
//  Created by Max Diess on 6/14/23.
//

import SwiftUI
import MapKit

struct ParkMapGPS: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    let parks: [Park]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: parks) { park in
            MapAnnotation(coordinate: park.coordinate) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ParkMapGPS_Previews: PreviewProvider {
    static var previews: some View {
        ParkMapGPS(parks: [
            Park(name: "Central Park", coordinate: CLLocationCoordinate2D(latitude: 40.7829, longitude: -73.9654)),
            Park(name: "Golden Gate Park", coordinate: CLLocationCoordinate2D(latitude: 37.7694, longitude: -122.4862)),
            Park(name: "Griffith Park", coordinate: CLLocationCoordinate2D(latitude: 34.1367, longitude: -118.2946))
        ])
    }
}
