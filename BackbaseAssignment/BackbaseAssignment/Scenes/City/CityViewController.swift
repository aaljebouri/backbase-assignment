//
//  CityViewController.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-15.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

//Today’s forecast, including: temperature, humidity, rain chances and wind information

class CityViewController: UIViewController, UICollectionViewDataSource {
    // MARK: - Properties
    var city:City!
    var forecasts = [Forecast]()
    
    // MARK: - IBOutlets
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var fiveDayForecastCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        navigationItem.title = NSLocalizedString(city.name, comment: "")
        
        fiveDayForecastCollectionView.registerNib(of: ForecastCollectionViewCell.self)
        
        ServiceLayer.shared.forecastService.getForecast(city) { error, forecast in
            guard let forecast = forecast else {
                print("Error getting forecast")
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title:  NSLocalizedString("Could not get forecast", comment: ""), message: NSLocalizedString("There was an issue fetching weather data from the server. Please try again later.", comment: ""), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self.temperatureLabel.text = "\(forecast.condition.temperatureRounded)°"
                self.humidityLabel.text = "\(forecast.condition.humidity)%"
                self.windLabel.text = "\(forecast.wind.directionInCardinal) \(forecast.wind.speedInKmHour) km/hr"
                self.precipitationLabel.text = "\(forecast.rain?.amountRounded ?? 0) mm"
                self.populateWeatherIcon(from: forecast)
            }
        }
        
        ServiceLayer.shared.forecastService.getFiveDayForecasts(city) { error, fiveDay in
            guard let fiveDay = fiveDay else {
                print("Error getting forecast")
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title:  NSLocalizedString("Could not get 5 day forecast", comment: ""), message: NSLocalizedString("There was an issue fetching weather data from the server. Please try again later.", comment: ""), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                return
            }
            
            DispatchQueue.main.async {
                self.forecasts = fiveDay.forecasts
                self.fiveDayForecastCollectionView.reloadData()
            }
        }
    }
    
    private func populateWeatherIcon(from forecast:Forecast) {
        guard forecast.weather.count > 0 else {
            print("Invalid weather conditions received")
            return
        }
        
        IconService.shared.getIconImage(forecast.weather[0].icon) { error, image in
            DispatchQueue.main.async {
                self.conditionImage.image = image
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.identifier, for: indexPath) as! ForecastCollectionViewCell
        cell.configure(with: forecasts[indexPath.row])
        return cell
    }
}
