//
//  FiveDayForecast.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

struct FiveDayForecast: Codable {
    var forecasts:[Forecast]
    
    private enum CodingKeys : String, CodingKey {
        case forecasts = "list"
    }
}
