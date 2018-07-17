//
//  RainTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest

class RainTests: XCTestCase {
    func testAmountRoundedRoundingUp() {
        let rain = Rain(amount: 87.83)
        
        XCTAssertEqual(88, rain.amountRounded)
    }
    
    func testAmountRoundedRoundingDown() {
        let rain = Rain(amount: 87.13)
        
        XCTAssertEqual(87, rain.amountRounded)
    }
    
    func testDeserilizationKeys() {
        let rainJson = "{ \"3h\" : 86.29 }"
        let rain = Rain.decode(from: rainJson.data(using: String.Encoding.utf8))
        
        XCTAssertNotNil(rain)
        XCTAssertEqual(86.29, rain?.amount)
    }
}
