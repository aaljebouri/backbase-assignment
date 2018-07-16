//
//  UIView+Extension.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-15.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    @objc class var identifier: String {
        return "\(self)"
    }
    
    @objc class var nib: UINib {
        return UINib(nibName: identifier, bundle: Bundle(for: self.self))
    }
}
