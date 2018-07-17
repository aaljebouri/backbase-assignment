//
//  ForecastServiceTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest
import CoreLocation

class ForecastServiceTests: XCTestCase {
    let apiConnectorMock = MockAPIConnector()
    
    var forecastService:ForecastService!
    
    override func setUp() {
        super.setUp()
        
        forecastService = ForecastService(apiConnector: apiConnectorMock)
    }
    
    func testGetForecastCallsAPICorrectly() {
        let city = City(locationCoordinates:Coordinate(locationCoordinate:CLLocationCoordinate2D(latitude: 46.9, longitude: 2.1)), cityName: "that city")
        
        forecastService.getForecast(city) { _, _ in
            
        }
        
        XCTAssertEqual(apiConnectorMock.endpointCaptured!, "/weather?lat=46.9&lon=2.1&units=metric")
        XCTAssertEqual(apiConnectorMock.methodCaptured!, .get)
    }
}
