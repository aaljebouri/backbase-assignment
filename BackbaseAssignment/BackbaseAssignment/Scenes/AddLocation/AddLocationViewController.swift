//
//  AddLocationViewController.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-12.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit
import MapKit

class AddLocationViewController: UIViewController, LocationManagerDelegate {
    // MARK: - Properties
    private let locationManager = LocationManager()
    private var selectedLocation:CLLocationCoordinate2D?
    private var selectedCityName:String?

    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        
        locationManager.delegate = self
        mapView.showsUserLocation = true
        
        let longPressRecogniser = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        longPressRecogniser.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPressRecogniser)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped(_:)))
        navigationItem.rightBarButtonItem = doneButton
    }

    // MARK: - LocationManagerDelegate
    func didUpdateLocation(_ location: CLLocationCoordinate2D) {
        DispatchQueue.main.async {
            let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: true)
        }
    }
    
    // MARK: - IBActions
    @objc func handleLongPress(_ gestureRecognizer : UIGestureRecognizer){
        guard gestureRecognizer.state != .began else {
            return
        }
        
        // Remove all previous pins
        mapView.removeAnnotations(mapView.annotations)
        
        let touchPoint = gestureRecognizer.location(in: mapView)
        let touchMapCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        
        let newPin = MKPointAnnotation()
        newPin.coordinate = touchMapCoordinate
        mapView.addAnnotation(newPin)
        
        selectedLocation = touchMapCoordinate
        
        locationManager.getCityNameFromLocation(touchMapCoordinate) { (cityName) in
            DispatchQueue.main.async {
                self.selectedCityName = cityName
                self.locationLabel.text = cityName
            }
        }
    }
    
    @objc func doneTapped(_ sender: Any){
        guard let selectedLocation = selectedLocation, let selectedCityName = selectedCityName else {
            let alert = UIAlertController(title:  NSLocalizedString("Location Not Selected", comment: ""), message: "Please select a location first by pressing and holding on the map.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }

        DataManager.shared.addBookmarkedCity(BookmarkedCity(locationCoordinates: Location(locationCoordinates:selectedLocation), cityName: selectedCityName))
        navigationController?.popViewController(animated: true)
    }
}
