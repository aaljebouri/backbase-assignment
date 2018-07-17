//
//  CityTest.swift
//  BackbaseAssignmentTests
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import XCTest
import CoreLocation

class CityTest: XCTestCase {
    let key = "test-cities"
    
    func testSaveAndLoadFromNSUserDefaults() {
        let userDefaults = UserDefaults.standard
        let citites = [City(locationCoordinates:Coordinate(locationCoordinate:CLLocationCoordinate2D(latitude: 46.9, longitude: 2.1)), cityName: "that city"),
                       City(locationCoordinates:Coordinate(locationCoordinate:CLLocationCoordinate2D(latitude: 67.0, longitude: -12.1)), cityName: "this city")]
        
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: citites as NSArray)
        userDefaults.set(archivedObject, forKey: key)
        userDefaults.synchronize()
        
        let citiesSaved = userDefaults.object(forKey: key)
        let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: citiesSaved as! Data) as? [City]
        
        XCTAssertNotNil(unarchivedData)
        XCTAssertEqual(unarchivedData?[0].coordinates.latitude, citites[0].coordinates.latitude)
        XCTAssertEqual(unarchivedData?[0].coordinates.longitude, citites[0].coordinates.longitude)
        XCTAssertEqual(unarchivedData?[0].name, citites[0].name)
        XCTAssertEqual(unarchivedData?[1].coordinates.longitude, citites[1].coordinates.longitude)
        XCTAssertEqual(unarchivedData?[1].coordinates.latitude, citites[1].coordinates.latitude)
        XCTAssertEqual(unarchivedData?[1].name, citites[1].name)
    }
}
