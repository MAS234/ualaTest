//
//  ualaTestTests.swift
//  ualaTestTests
//
//  Created by Miguel Martinez on 03/08/2024.
//

import XCTest
@testable import ualaTest

class CityViewModelTests: XCTestCase {

    var viewModel: CityViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CityViewModel()
        viewModel.cities = [
            City(id: 1, country: "US", name: "New York", coord: Coord(lat: 40.7128, lon: -74.006)),
            City(id: 2, country: "US", name: "Los Angeles", coord: Coord(lat: 34.0522, lon: -118.2437)),
            City(id: 3, country: "AU", name: "Sydney", coord: Coord(lat: -33.8688, lon: 151.2093)),
            City(id: 4, country: "GB", name: "London", coord: Coord(lat: 51.5074, lon: -0.1276))
        ]
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFilterCitiesWithEmptyPrefix() {
        let filteredCities = viewModel.filterCities(prefix: "")
        XCTAssertEqual(filteredCities.count, 4)
    }

    func testFilterCitiesWithMatchingPrefix() {
        let filteredCities = viewModel.filterCities(prefix: "Ne")
        XCTAssertEqual(filteredCities.count, 1)
        XCTAssertEqual(filteredCities.first?.name, "New York")
    }

    func testFilterCitiesWithNoMatchingPrefix() {
        let filteredCities = viewModel.filterCities(prefix: "XYZ")
        XCTAssertEqual(filteredCities.count, 0)
    }

    func testFilterCitiesCaseInsensitive() {
        let filteredCities = viewModel.filterCities(prefix: "sYd")
        XCTAssertEqual(filteredCities.count, 1)
        XCTAssertEqual(filteredCities.first?.name, "Sydney")
    }

    func testFilterCitiesWithInvalidCharacters() {
        let filteredCities = viewModel.filterCities(prefix: "!@#$%")
        XCTAssertEqual(filteredCities.count, 0)
    }
}
