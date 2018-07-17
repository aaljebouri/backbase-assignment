//
//  ConditionTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest

class ConditionTests: XCTestCase {
    func testTemperatureRoundedRoundingUp() {
        let condition = Condition(temperature: 13.9, humidity: 20.0)
        
        XCTAssertEqual(14, condition.temperatureRounded)
    }
    
    func testTemperatureRoundedRoundingDown() {
        let condition = Condition(temperature: 13.1, humidity: 20.0)
        
        XCTAssertEqual(13, condition.temperatureRounded)
    }
    
    func testDeserilizationKeys() {
        let conditionJson = "{ \"temp\" : 13.29, \"humidity\" : 23.8 }"
        let condition = Condition.decode(from: conditionJson.data(using: String.Encoding.utf8))
        
        XCTAssertNotNil(condition)
        XCTAssertEqual(13.29, condition?.temperature)
        XCTAssertEqual(23.8, condition?.humidity)
    }
}
