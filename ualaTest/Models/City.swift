//
//  City.swift
//  ualaTest
//
//  Created by Miguel Martinez on 03/08/2024.
//

import Foundation

struct City: Identifiable, Codable, Equatable {
    let id: Int
    let country: String
    let name: String
    let coord: Coord

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case country
        case name
        case coord
    }
}
