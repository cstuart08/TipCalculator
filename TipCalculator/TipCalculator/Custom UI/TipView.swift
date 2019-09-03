//
//  TipView.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

class TipView: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    func setupUI() {
        backgroundColor = .darkBlue
        addAccentBorder(color: .white)
        addCornerRadius(16)
    }
}
