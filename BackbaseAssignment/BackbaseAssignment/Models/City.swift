//
//  File.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-13.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class City : NSObject, NSCoding {
    let coordinate:Coordinate
    let name:String
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(coordinate, forKey: "coordinate")
        aCoder.encode(name, forKey: "name")
    }
    
    init(locationCoordinates:Coordinate, cityName:String) {
        self.coordinate = locationCoordinates
        self.name = cityName
    }
    
    required init?(coder aDecoder: NSCoder) {
        coordinate = aDecoder.decodeObject(forKey: "coordinate") as! Coordinate
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
}
