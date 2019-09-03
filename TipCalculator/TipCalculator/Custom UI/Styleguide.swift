//
//  Styleguide.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

struct FontNames {
    static let robotoBold = "Roboto-Bold"
    static let robotoLight = "Roboto-Light"
    static let robotoMedium = "Roboto-Medium"
    static let robotoRegular = "Roboto-Regular"
    static let robotoThin = "Roboto-Thin"
}

extension UIColor {
    static let darkBlue = UIColor(named: "darkBlue")!
    static let mediumGray = UIColor(named: "mediumGray")!
    static let mediumPastelBlue = UIColor(named: "mediumPastelBlue")!
}

extension UIView {
    func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
    }
    
    func addAccentBorder(width: CGFloat = 3, color: UIColor = .white) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func rotate(by radians: CGFloat = -CGFloat.pi/2) {
        transform = CGAffineTransform(rotationAngle: radians)
    }
}
