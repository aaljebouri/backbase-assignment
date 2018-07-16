//
//  Coordinates.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import CoreLocation

class Coordinates : NSObject, NSCoding {
    let latitude:Double
    let longitude:Double
    
    init(locationCoordinates:CLLocationCoordinate2D) {
        self.latitude = locationCoordinates.latitude
        self.longitude = locationCoordinates.longitude
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
