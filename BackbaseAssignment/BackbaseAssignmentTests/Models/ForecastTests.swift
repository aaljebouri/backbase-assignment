//
//  ForecastTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest

class ForecastTests: XCTestCase {
    func testDeserilizationKeys() {
        let forecastJson = "{ \"wind\" : { \"speed\" : 4.3, \"deg\" : 220 }, "
            + "\"main\" : { \"temp\" : -1.3, \"humidity\" : 5 }, "
            + " \"weather\" : [ { \"icon\" : \"3d\"} ]}"
        let forecast = Forecast.decode(from: forecastJson.data(using: String.Encoding.utf8))
        
        XCTAssertNotNil(forecast)
        XCTAssertEqual(4.3, forecast?.wind.speed)
        XCTAssertEqual(220.0, forecast?.wind.degree)
        XCTAssertEqual(-1.3, forecast?.condition.temperature)
        XCTAssertEqual(5.0, forecast?.condition.humidity)
        XCTAssertEqual("3d", forecast?.weather[0].icon)
    }
}
