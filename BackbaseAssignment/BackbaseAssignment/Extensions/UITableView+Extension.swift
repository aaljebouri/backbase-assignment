//
//  UITableView+Extension.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-15.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib(of cellClass: UITableViewCell.Type) {
        self.register(cellClass.nib, forCellReuseIdentifier: cellClass.identifier)
    }
}
