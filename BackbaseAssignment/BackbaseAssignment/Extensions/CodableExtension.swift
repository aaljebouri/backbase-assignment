//
//  CodableExtension.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(from data:Data?) -> Self? {
        guard let data = data else {
            return nil
        }
        
        print("JSON data in string format: \(String(data: data, encoding:String.Encoding.utf8) as String?)")
        
        let jsonDecoder = JSONDecoder()
        var response:Self? = nil
        do {
            try response = jsonDecoder.decode(self, from: data)
        } catch let error {
            print ("JSON error deserializing data: \(error)")
        }
        
        return response
    }
}
