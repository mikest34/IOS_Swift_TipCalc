//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Michael Stumhofer on 9/23/14.
//  Copyright (c) 2014 Momo Studios. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
        
    }
    
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    // 1
    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        // 2
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}