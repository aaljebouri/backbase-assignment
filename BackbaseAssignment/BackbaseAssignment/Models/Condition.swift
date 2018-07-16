//
//  Condition.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

struct Condition : Codable {
    var temperature:Double
    var humidityPercentage:Double
    var temperatureRounded:Int {
        return Int(round(temperature))
    }
    
    private enum CodingKeys : String, CodingKey {
        case temperature = "temp", humidityPercentage = "humidity"
    }
}
