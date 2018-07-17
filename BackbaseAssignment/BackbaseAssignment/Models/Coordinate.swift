//
//  Coordinate.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import CoreLocation

class Coordinate : NSObject, NSCoding {
    let latitude:Double
    let longitude:Double
    
    init(locationCoordinate:CLLocationCoordinate2D) {
        self.latitude = locationCoordinate.latitude
        self.longitude = locationCoordinate.longitude
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
    }
    
    required init?(coder aDecoder: NSCoder) {
        latitude = aDecoder.decodeDouble(forKey: "latitude")
        longitude = aDecoder.decodeDouble(forKey: "longitude")
    }
}
