//
//  CityTableViewCell.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-13.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with bookmarkedCity:BookmarkedCity) {
        cityNameLabel.text = bookmarkedCity.name
    }
}
