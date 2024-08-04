//
//  CityMapViewModel.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import Foundation
import MapKit
import Combine

class CityMapViewModel: ObservableObject {
    @Published var city: City
    
    init(city: City) {
        self.city = city
    }

    func getCoordinate() -> IdentifiableCoordinate {
        let coord = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
        return IdentifiableCoordinate(coordinate: coord)
    }

    func getRegion() -> MKCoordinateRegion {
        let coord = getCoordinate().coordinate
        return MKCoordinateRegion(
            center: coord,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
}


































