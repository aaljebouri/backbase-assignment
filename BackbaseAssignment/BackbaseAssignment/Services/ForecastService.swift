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
    private let forecastEndpoint = "/forecast"
    private let latitudeQueryParameter = "lat"
    private let longitudeQueryParameter = "lon"
    private let unitQueryParameter = "units"
    private let defaultUnit = "metric"
    
    private let apiConnector:APIConnector
    
    init(apiConnector: APIConnector) {
        self.apiConnector = apiConnector
    }

    func getForecast(_ city:City, completion: @escaping (_ error:APIError?, _ response:Forecast?) -> Void) {
        let endpoint = weatherEndpoint.addQueryParameter(latitudeQueryParameter, value: city.coordinate.latitude)
                                        .addQueryParameter(longitudeQueryParameter, value: city.coordinate.longitude)
                                        .addQueryParameter(unitQueryParameter, value: defaultUnit)
        
        apiConnector.performCall(toEndpoint: endpoint, using: .get, responseType: Forecast.self) { (error, forecast) in
            completion(error, forecast)
        }
    }
    
    func getFiveDayForecasts(_ city:City, completion: @escaping (_ error:APIError?, _ response:FiveDayForecast?) -> Void) {
        let endpoint = forecastEndpoint.addQueryParameter(latitudeQueryParameter, value: city.coordinate.latitude)
            .addQueryParameter(longitudeQueryParameter, value: city.coordinate.longitude)
            .addQueryParameter(unitQueryParameter, value: defaultUnit)
        
        apiConnector.performCall(toEndpoint: endpoint, using: .get, responseType: FiveDayForecast.self) { (error, forecast) in
            completion(error, forecast)
        }
    }
}
