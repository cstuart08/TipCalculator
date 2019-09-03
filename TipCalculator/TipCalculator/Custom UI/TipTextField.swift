//
//  TipTextField.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

class TipTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateFont(fontName: FontNames.robotoRegular)
        setupUI()
    }
    
    func setupUI() {
        updatePlaceHolderColor()
        textColor = .white
        backgroundColor = .darkBlue
        tintColor = .white
        addAccentBorder()
        addCornerRadius(6)
        layer.masksToBounds = true
        
        
    }
    
    func updateFont(fontName: String) {
        guard let size = font?.pointSize else { return }
        font = UIFont(name: fontName, size: size)
    }
    
    func updatePlaceHolderColor() {
        let placeholderText = placeholder ?? ""
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [.foregroundColor: UIColor.lightGray, .font: UIFont(name: FontNames.robotoThin, size: 16)!])
    }

}
