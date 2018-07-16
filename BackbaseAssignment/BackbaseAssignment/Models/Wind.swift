//
//  File.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

struct Wind : Codable {
    var speed:Double
    var degree:Double?
    var speedInKmHour:Double {
        return speed * 60 * 60 / 1000
    }
    var directionInCardinal:String {
        guard let degree = self.degree else {
            return "N"
        }
        
        switch degree {
        case _ where degree < 45:
            return "N"
        case _ where degree < 90:
            return "NE"
        case _ where degree < 135:
            return "E"
        case _ where degree < 180:
            return "SE"
        case _ where degree < 225:
            return "S"
        case _ where degree < 270:
            return "SW"
        case _ where degree < 315:
            return "W"
        case _ where degree < 360:
            return "NW"
        default:
            return "N"
        }
    }
    
    private enum CodingKeys : String, CodingKey {
        case speed, degree = "deg"
    }
}
