//
//  File.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-13.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class City : NSObject, NSCoding {
    let coordinates:Coordinates
    let name:String
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(coordinates, forKey: "coordinates")
        aCoder.encode(name, forKey: "name")
    }
    
    init(locationCoordinates:Coordinates, cityName:String) {
        self.coordinates = locationCoordinates
        self.name = cityName
    }
    
    required init?(coder aDecoder: NSCoder) {
        coordinates = aDecoder.decodeObject(forKey: "coordinates") as! Coordinates
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
}
