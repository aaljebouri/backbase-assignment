//
//  Forecast.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

struct Forecast: Codable {
    var wind:Wind
    var condition:Condition
    var weather:[Weather]
    
    private enum CodingKeys : String, CodingKey {
        case wind, condition = "main", weather
    }
}
