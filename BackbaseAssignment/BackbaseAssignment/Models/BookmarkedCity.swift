//
//  File.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-13.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import CoreLocation

class Location : NSObject, NSCoding {
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
        latitude = aDecoder.decodeObject(forKey: "latitude") as! Double
        longitude = aDecoder.decodeObject(forKey: "longitude") as! Double
    }
}

class BookmarkedCity : NSObject, NSCoding {
    let locationCoordinates:Location
    let cityName:String
    
    static func == (lhs: BookmarkedCity, rhs: BookmarkedCity) -> Bool {
        return (lhs.locationCoordinates.latitude == rhs.locationCoordinates.latitude) &&
            (lhs.locationCoordinates.longitude == rhs.locationCoordinates.longitude)
    }
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(locationCoordinates, forKey: "locationCoordinates")
        aCoder.encode(cityName, forKey: "cityName")
    }
    
    init(locationCoordinates:Location, cityName:String) {
        self.locationCoordinates = locationCoordinates
        self.cityName = cityName
    }
    
    required init?(coder aDecoder: NSCoder) {
        locationCoordinates = aDecoder.decodeObject(forKey: "locationCoordinates") as! Location
        cityName = aDecoder.decodeObject(forKey: "cityName") as! String
    }
}
