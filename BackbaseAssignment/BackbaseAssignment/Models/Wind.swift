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
        case _ where degree < 22.5:
            return "N"
        case _ where degree < 67.5:
            return "NE"
        case _ where degree < 112.5:
            return "E"
        case _ where degree < 157.5:
            return "SE"
        case _ where degree < 202.5:
            return "S"
        case _ where degree < 247.5:
            return "SW"
        case _ where degree < 292.5:
            return "W"
        case _ where degree < 337.5:
            return "NW"
        default:
            return "N"
        }
    }
    
    private enum CodingKeys : String, CodingKey {
        case speed, degree = "deg"
    }
}
