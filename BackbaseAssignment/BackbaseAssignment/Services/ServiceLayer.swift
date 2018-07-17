//
//  ServiceLayer.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class ServiceLayer {
    static let shared = ServiceLayer()
    
    private let apiConnector = APIConnector()
    
    let forecastService:ForecastService
    let dataManager:DataManager
    
    init() {
        forecastService = ForecastService(apiConnector: apiConnector)
        dataManager = DataManager()
    }
}
