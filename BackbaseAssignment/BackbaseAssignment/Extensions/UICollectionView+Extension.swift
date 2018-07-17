//
//  UICollectionView+Extension.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-17.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerNib(of cellClass: UICollectionViewCell.Type) {
        self.register(cellClass.nib, forCellWithReuseIdentifier: cellClass.identifier)
    }
}
