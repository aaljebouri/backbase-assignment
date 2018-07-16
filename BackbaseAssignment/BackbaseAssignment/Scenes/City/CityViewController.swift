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
    
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var chanceOfRainLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        navigationItem.title = NSLocalizedString(bookmarkedCity.name, comment: "")
        
        APIConnector.shared.performCall(toEndpoint: "/weather?lat=\(bookmarkedCity.locationCoordinates.latitude)&lon=\(bookmarkedCity.locationCoordinates.longitude)", using: .get, responseType: Forecast.self) { (error, forecast) in
            print("\(forecast?.condition.temperature ?? 0)")
            
            DispatchQueue.main.async {
                self.temperatureLabel.text = "\(forecast?.condition.temperatureRounded ?? 0)°"
                self.humidityLabel.text = "\(forecast?.condition.humidityPercentage ?? 0)%"
                self.windLabel.text = "\(forecast?.wind.directionInCardinal ?? "") \(forecast?.wind.speedInKmHour ?? 0) km/hr"
                
                DispatchQueue.global().async {
                    if let iconUrl = URL(string: "http://openweathermap.org/img/w/" + (forecast?.weather[0].icon ?? "") + ".png") {
                        do {
                            let iconData = try Data(contentsOf: iconUrl)
                            
                            DispatchQueue.main.async {
                                self.conditionImage.image = UIImage(data: iconData)
                            }
                        } catch let error {
                            print ("Error getting image data: \(error)")
                        }
                    }
                }
            }
            
        }
    }
}
