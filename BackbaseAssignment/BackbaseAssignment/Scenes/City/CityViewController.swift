//
//  CityViewController.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-15.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

//Today’s forecast, including: temperature, humidity, rain chances and wind information

class CityViewController: UIViewController {
    var bookmarkedCity:BookmarkedCity!

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        navigationItem.title = NSLocalizedString(bookmarkedCity.name, comment: "")
        
        APIConnector.shared.performCall(toEndpoint: "/weather?lat=\(bookmarkedCity.locationCoordinates.latitude)&lon=\(bookmarkedCity.locationCoordinates.longitude)", using: .get, responseType: Forecast.self) { (error, forecast) in
            print("\(forecast?.wind.speed ?? 0)")
        }
    }
}
