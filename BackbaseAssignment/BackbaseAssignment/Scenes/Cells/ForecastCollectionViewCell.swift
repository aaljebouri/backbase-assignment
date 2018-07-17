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
    
    func configure(with forecast:Forecast) {
        temperatureLabel.text = "\(forecast.condition.temperatureRounded)°"
    }
}
