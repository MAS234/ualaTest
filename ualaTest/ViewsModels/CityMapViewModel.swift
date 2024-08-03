//
//  CityMapViewModel.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import Foundation
import MapKit

class CityMapViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion
    var coordinate: IdentifiableCoordinate
    var city: City

    init(city: City) {
        self.city = city
        let coord = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        self.coordinate = IdentifiableCoordinate(coordinate: coord)
        self.region = MKCoordinateRegion(
            center: coord,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }

    func updateRegion(for city: City) {
        let coord = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        self.coordinate = IdentifiableCoordinate(coordinate: coord)
        self.region = MKCoordinateRegion(
            center: coord,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}

