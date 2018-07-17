//
//  Rain.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

struct Rain : Codable {
    var amount:Double?
    var amountRounded:Int {
        return Int(round(amount ?? 0))
    }
    
    private enum CodingKeys : String, CodingKey {
        case amount = "3h"
    }
}
