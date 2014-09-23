//
//  ViewController.swift
//  TipCalculator
//
//  Created by Michael Stumhofer on 9/23/14.
//  Copyright (c) 2014 Momo Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!

    let tipCalc = TipCalculatorModel(total: 0, taxPct: 0.06)
    
    func refreshUI() {
        // 1
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        // 2
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        // 3
        taxPctLabel.text = "Tax Percent (\(Int(taxPctSlider.value))%)"
        // 4
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func totalTapped(sender : AnyObject) {
        totalTextField.text = nil
    }

    @IBAction func calculateTapped(sender : AnyObject) {
        // 1
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        // 2
        let possibleTips = tipCalc.returnPossibleTips()
        var results = "Suggested tips for a " + NSString(format: "$%.2f\n", tipCalc.total) + " check\n"
        // 3
        for (tipPct, tipValue) in possibleTips {
            // 4
            // results += "\(tipPct)%: \(tipValue)\n"
            results += "\(tipPct)%: " + NSString(format: "$%.2f\n", tipValue)
        }
        // 5
        resultsTextView.text = results
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }

    
    

}

