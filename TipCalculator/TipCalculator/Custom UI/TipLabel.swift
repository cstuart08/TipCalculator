//
//  TipLabel.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

class TipLabel: UILabel {
    func updateFont(fontName: String) {
        print("hello")
        self.font = UIFont(name: fontName, size: 25)
    }
}

class TipLabelRegular: TipLabel {
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Regluar")
        updateFont(fontName: FontNames.robotoRegular)
        textColor = .white
    }
    
    // Mark: - Custom Methods
    
    
}

class boldRobotoLabel: TipLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateFont(fontName: FontNames.robotoBold)
    }
}

class lightRobotoLabel: TipLabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateFont(fontName: FontNames.robotoLight)
        textColor = .white
    }
}
