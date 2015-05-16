//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Duc Tran on 1/27/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import Foundation

class TipCalc {
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float) {
        self.amountBeforeTax = amountBeforeTax;
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        // TODO: Calculate the tipAmount and totalAmount variables
		//		 Note: you just need to perform the operators to calculate the two variables. Please do not chagne the vaiable names (identifiers) or else it will break the application
		// tipAmount = ...
        tipAmount = amountBeforeTax * tipPercentage
		// totalAmount = ...
        totalAmount = tipAmount + amountBeforeTax
    }
    
}