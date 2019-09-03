//
//  TipViewController.swift
//  TipCalculator
//
//  Created by Apps on 9/2/19.
//  Copyright © 2019 Cameron Stuart. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var attentiveButton: UIButton!
    @IBOutlet weak var unatentiveButton: UIButton!
    @IBOutlet weak var politeButton: UIButton!
    @IBOutlet weak var rudeButton: UIButton!
    @IBOutlet weak var helpfulButton: UIButton!
    @IBOutlet weak var uselessButton: UIButton!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var tipTotalLabel: UILabel!
    @IBOutlet weak var totalBillAmountLabel: UILabel!
    
    var attentiveStatus: Bool = false
    var unattentiveStatus: Bool = false
    var politeStatus: Bool = false
    var rudeStatus: Bool = false
    var helpfulStatus: Bool = false
    var uselessStatus: Bool = false
    var reccomendedTipPercent: Double = 10.00
    var reccomendedTipAmount: Double = 0.00
    var totalBill: Double = 0.00
    
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapResign))
        view.addGestureRecognizer(tap)
    }
    
    func setupUI() {
        attentiveButton.setImage(nil, for: .normal)
        unatentiveButton.setImage(nil, for: .normal)
        politeButton.setImage(nil, for: .normal)
        rudeButton.setImage(nil, for: .normal)
        helpfulButton.setImage(nil, for: .normal)
        uselessButton.setImage(nil, for: .normal)
        tipTotalLabel.text = "$0.00"
        totalBillAmountLabel.text = "$0.00"
        tipPercentageLabel.text = "10.0%"
    }
    
    @objc func tapResign() {
        billTotalTextField.resignFirstResponder()
        updateTipPercentage()
    }
    
    func updateTipPercentage() {
        if reccomendedTipPercent < 0 {
            tipPercentageLabel.text = "0.00%"
            tipTotalLabel.text = "$0.00"
        } else {
            tipPercentageLabel.text = "\(reccomendedTipPercent)%"
            guard let str = billTotalTextField.text else { return }
            if let numberFormatter = NumberFormatter().number(from: str) {
                let f = Double(truncating: numberFormatter)
                let x = (f * (reccomendedTipPercent / 100)).dollarString
                tipTotalLabel.text = x
                reccomendedTipAmount = (f * (reccomendedTipPercent / 100))
            }
        }
        updateTotalBill()
    }
    
    func updateTotalBill() {
        guard let str = billTotalTextField.text else { return }
        if let numberFormatter = NumberFormatter().number(from: str) {
            let x = Double(truncating: numberFormatter)
            var totalBill: Double
            if reccomendedTipPercent < 0 {
                totalBill = x
            } else {
                totalBill = x + reccomendedTipAmount
            }
            totalBillAmountLabel.text = String(totalBill.dollarString)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func attentiveButtonTapped(_ sender: Any) {
        if unattentiveStatus == true {
            unatentiveButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            unattentiveStatus = false
        }
        if attentiveStatus == false {
            attentiveButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            attentiveStatus = true
        } else if attentiveStatus == true {
            attentiveButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            attentiveStatus = false
        }
    }
    
    @IBAction func unattentiveButtonTapped(_ sender: Any) {
        if attentiveStatus == true {
            attentiveButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            attentiveStatus = false
        }
        if unattentiveStatus == false {
            unatentiveButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            unattentiveStatus = true
        } else if unattentiveStatus == true {
            unatentiveButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            unattentiveStatus = false
        }
    }
    
    @IBAction func politeButtonTapped(_ sender: Any) {
        if rudeStatus == true {
            rudeButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            rudeStatus = false
        }
        if politeStatus == false {
            politeButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            politeStatus = true
        } else if politeStatus == true {
            politeButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            politeStatus = false
        }
    }
    
    @IBAction func rudeButtonTapped(_ sender: Any) {
        if politeStatus == true {
            politeButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            politeStatus = false
        }
        if rudeStatus == false {
            rudeButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            rudeStatus = true
        } else if rudeStatus == true {
            rudeButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            rudeStatus = false
        }
    }
    
    @IBAction func helpfulButtonTapped(_ sender: Any) {
        if uselessStatus == true {
            uselessButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            uselessStatus = false
        }
        if helpfulStatus == false {
            helpfulButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            helpfulStatus = true
        } else if helpfulStatus == true {
            helpfulButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            helpfulStatus = false
        }
    }
    
    @IBAction func uselessButtonTapped(_ sender: Any) {
        if helpfulStatus == true {
            helpfulButton.setImage(nil, for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            helpfulStatus = false
        }
        if uselessStatus == false {
            uselessButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            reccomendedTipPercent -= 4
            updateTipPercentage()
            updateTotalBill()
            uselessStatus = true
        } else if uselessStatus == true {
            uselessButton.setImage(nil, for: .normal)
            reccomendedTipPercent += 4
            updateTipPercentage()
            updateTotalBill()
            uselessStatus = false
        }
    }
}
