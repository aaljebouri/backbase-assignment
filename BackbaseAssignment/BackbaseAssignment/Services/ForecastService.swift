//
//  ForecastService.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-16.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class ForecastService {
    private let weatherEndpoint = "/weather"
    private let latitudeQueryParameter = "lat"
    private let longitudeQueryParameter = "lon"
    private let unitQueryParameter = "units"
    private let defaultUnit = "metric"
    
    static let shared = ForecastService()

    func getForecast(_ city:City, completion: @escaping (_ error:Error?, _ response:Forecast?) -> Void) {
        let endpoint = weatherEndpoint.addQueryParameter(latitudeQueryParameter, value: city.coordinates.latitude)
                                        .addQueryParameter(longitudeQueryParameter, value: city.coordinates.longitude)
                                        .addQueryParameter(unitQueryParameter, value: defaultUnit)
        
        APIConnector.shared.performCall(toEndpoint: endpoint, using: .get, responseType: Forecast.self) { (error, forecast) in
            completion(error, forecast)
        }
    }
}
