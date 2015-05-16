//
//  ViewController.swift
//  TipCalculator
//
//  Created by Duc Tran on 1/27/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    
    
    let tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2)
    // An array of text fields
    var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments:[tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip: %d%%", arguments:[Int(tipCalc.tipPercentage * 100)])
        eachPersonAmountLabel.text = String(format:"Each: $%0.2f", arguments:[(tipCalc.totalAmount / numberOfPeopleSlider.value)])
        numberOfPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        // Populate the textFields array
        textFields = [amountBeforeTaxTextField]
    }
    
    func calcTip() {
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text) as NSString).floatValue
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        resultLabel.text = String(format:"Total: $%0.2f   Tip: $%0.2f", arguments:[tipCalc.totalAmount, tipCalc.tipAmount])
        var numOfPeople: Int = Int(numberOfPeopleSlider.value);
        eachPersonAmountLabel.text = String(format: "Each: %0.2f", arguments: [tipCalc.totalAmount / Float(numOfPeople)])
    }
    
    @IBAction func tipSliderValueChanged(sender: AnyObject) {
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
    
    @IBAction func numberOfPeopleSliderChanged(sender: AnyObject) {
        numberOfPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        updateUI()
    }
    
    
    @IBAction func amountBeforeTaxTextFieldChanged(sender: AnyObject) {
        calcTip()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let textFieldsArray = textFields as NSArray
        let i = textFieldsArray.indexOfObject(textField)
        if i < textFieldsArray.count - 1 {
            // There's the next text field
            let nextTextField = textFieldsArray[i+1] as! UITextField
            // focus on the next text field
            nextTextField.becomeFirstResponder()
        } else {
            // the last text field, dismiss the keyboard
            textField.resignFirstResponder()
            // Then we calculate the tip
            calcTip()
        }
        return true;    // yes, we want to return
    }
}






























