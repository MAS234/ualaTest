//
//  CityDetailUITests.swift
//  ualaTestTests
//
//  Created by Miguel Martinez on 03/08/2024.
//

import XCTest

class CityDetailUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testCityDetailDisplaysCorrectInformation() {
        let citiesList = app.tables
        let cityCell = citiesList.cells.staticTexts["New York, US"]
        
        XCTAssertTrue(cityCell.exists, "The city cell should be in the list")
        cityCell.tap()

        let detailsNavigationBar = app.navigationBars["New York"]
        XCTAssertTrue(detailsNavigationBar.exists, "The details screen should be displayed")
        
        let cityName = app.staticTexts["New York, US"]
        XCTAssertTrue(cityName.exists, "The city name should be displayed on the details screen")
        
        let latitude = app.staticTexts["Latitude: 40.7128"]
        XCTAssertTrue(latitude.exists, "The latitude should be displayed on the details screen")
        
        let longitude = app.staticTexts["Longitude: -74.006"]
        XCTAssertTrue(longitude.exists, "The longitude should be displayed on the details screen")
        
        let detailsButton = app.buttons["Ver Detalles"]
        XCTAssertTrue(detailsButton.exists, "The details button should be displayed")
        detailsButton.tap()
        
        let detailsView = app.otherElements["CityDetailsView"]
        XCTAssertTrue(detailsView.exists, "The detailed view should be displayed")
        
    }
}

