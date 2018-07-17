//
//  CoordinatesTests.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest
import CoreLocation

class CoordinateTests: XCTestCase {
    let key = "test-coordinate"
    
    func testSaveAndLoadFromNSUserDefaults() {
        let userDefaults = UserDefaults.standard
        let coordinate = Coordinate(locationCoordinate: CLLocationCoordinate2D(latitude: 36.9, longitude: 82.4))
        
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: coordinate)
        userDefaults.set(archivedObject, forKey: key)
        userDefaults.synchronize()
        
        let coordinateSaved = userDefaults.object(forKey: key)
        let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: coordinateSaved as! Data) as? Coordinate
        
        XCTAssertNotNil(unarchivedData)
        XCTAssertEqual(unarchivedData?.latitude, coordinate.latitude)
        XCTAssertEqual(unarchivedData?.longitude, coordinate.longitude)
    }
}
