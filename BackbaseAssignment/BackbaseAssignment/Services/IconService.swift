//
//  IconService.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import UIKit

class IconService {
    private let imageBaseUrl = "http://openweathermap.org/img/w/"
    private let imageExtension = ".png"
    
    static let shared = IconService()
    
    func getIconImage(_ icon:String, completion: @escaping (_ error:Error?, _ response:UIImage?) -> Void) {
        guard let iconUrl = URL(string: imageBaseUrl + icon + imageExtension) else {
            completion(nil, nil)
            return
        }
        
        DispatchQueue.global().async {
            do {
                let iconData = try Data(contentsOf: iconUrl)
                completion(nil, UIImage(data: iconData))
            } catch let error {
                completion(error, nil)
                print ("Error getting image data: \(error)")
            }
        }
    }
}
