//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var billingSystem = BillSystem()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        billingSystem.tip = sender.currentTitle!
        zeroPctButton.isSelected = billingSystem.getZeroPercButtonStatus()
        tenPctButton.isSelected = billingSystem.getTenPercButtonStatus()
        twentyPctButton.isSelected = billingSystem.getTwentyPercButtonStatus()
        billingSystem.setBillAmount(Double(billTextField.text!) ?? 0.0)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billingSystem.setPeople(Int(sender.value))
        splitNumberLabel.text = billingSystem.getSplitValue()

    }

    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? ResultsViewController
        dest?.result = billingSystem.getResult()
        dest?.tipPercent = billingSystem.tip
        dest?.totalSplitter = billingSystem.getSplitValue()
    }
}

