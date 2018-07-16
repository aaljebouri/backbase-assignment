//
//  String+Extension.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

extension String {
    func addQueryParameter(_ parameterName:String, value:Any) -> String {
        return self + (self.contains("?") ? "&" : "?") + parameterName + "=" + "\(value)"
    }
}
