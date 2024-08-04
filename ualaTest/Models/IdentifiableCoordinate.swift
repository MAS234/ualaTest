//
//  IdentifiableCoordinate.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import Foundation
import MapKit

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

