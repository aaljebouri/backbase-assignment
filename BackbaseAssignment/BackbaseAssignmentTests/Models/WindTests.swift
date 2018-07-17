//
//  WindTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest

class WindTests: XCTestCase {
    func testSpeedInKmHrCorrectlyConverts() {
        let wind = Wind(speed: 5.2, degree: 20.0)
        
        XCTAssertEqual(5.2 * 60 * 60 / 1000, wind.speedInKmHour)
    }
    
    func testDirectionInCardinalDefaultWhenNilNorth() {
        let wind = Wind(speed: 5.2, degree: nil)
        
        XCTAssertEqual("N", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalNorth() {
        var wind = Wind(speed: 5.2, degree: 0)
        
        XCTAssertEqual("N", wind.directionInCardinal)
        
        wind = Wind(speed: 5.2, degree: 350)
        
        XCTAssertEqual("N", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalNorthEast() {
        let wind = Wind(speed: 5.2, degree: 45)
        
        XCTAssertEqual("NE", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalEast() {
        let wind = Wind(speed: 5.2, degree: 90)
        
        XCTAssertEqual("E", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalSouthEast() {
        let wind = Wind(speed: 5.2, degree: 135)
        
        XCTAssertEqual("SE", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalSouth() {
        let wind = Wind(speed: 5.2, degree: 180)
        
        XCTAssertEqual("S", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalSouthWest() {
        let wind = Wind(speed: 5.2, degree: 225)
        
        XCTAssertEqual("SW", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalWest() {
        let wind = Wind(speed: 5.2, degree: 270)
        
        XCTAssertEqual("W", wind.directionInCardinal)
    }
    
    func testDirectionInCardinalNorthWest() {
        let wind = Wind(speed: 5.2, degree: 315)
        
        XCTAssertEqual("NW", wind.directionInCardinal)
    }
    
    func testDeserilizationKeys() {
        let windJson = "{ \"speed\" : 2.1, \"deg\" : 312.6 }"
        let wind = Wind.decode(from: windJson.data(using: String.Encoding.utf8))
        
        XCTAssertNotNil(wind)
        XCTAssertEqual(2.1, wind?.speed)
        XCTAssertEqual(312.6, wind?.degree)
    }
}
