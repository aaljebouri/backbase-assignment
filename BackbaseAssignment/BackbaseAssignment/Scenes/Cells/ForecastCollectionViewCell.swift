//
//  ForecastCollectionViewCell.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with forecast:Forecast) {
        temperatureLabel.text = "\(forecast.condition.temperatureRounded)°"
        populateTime(from: forecast)
        populateDate(from: forecast)
        populateWeatherIcon(from: forecast)
    }
    
    private func populateTime(from forecast:Forecast) {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        timeLabel.text = formatter.string(from: forecast.date)
    }
    
    private func populateDate(from forecast:Forecast) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        dateLabel.text = formatter.string(from: forecast.date)
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
}
