//
//  DoubleExtension.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import Foundation

extension Double {
    var dollarString: String {
        return String(format: "$%.2f", self)
    }
}
