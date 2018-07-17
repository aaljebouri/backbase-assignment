//
//  LocationManager.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-12.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func didUpdateLocation(_ location:CLLocationCoordinate2D)
}

class LocationManager : NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    var delegate:LocationManagerDelegate?
    
    override init() {
        super.init()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        delegate?.didUpdateLocation(coordinate)
    }
    
    func getCityNameFromLocation(_ location:CLLocationCoordinate2D, completionHandler: @escaping (String?) -> Void){
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            guard let placemarks = placemarks, placemarks.count > 0 else {
                return
            }
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks[0]
            
            var cityName:String?

            // City
            if let city = placeMark.locality {
                cityName = city
            }
            
            completionHandler(cityName)
        }
    }
}
