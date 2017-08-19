//
//  ViewController.swift
//  TipAdvisor
//
//  Created by Sophia Ngo on 8/12/17.
//  Copyright © 2017 Sophia Ngo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipCurrencyLabel: UILabel!
    @IBOutlet weak var totalCurrencyLabel: UILabel!
    @IBOutlet weak var twoPayerLabel: UILabel!
    @IBOutlet weak var twoPayerCurrencyLabel: UILabel!
    @IBOutlet weak var threePayerLabel: UILabel!
    @IBOutlet weak var threePayerCurrencyLabel: UILabel!
    @IBOutlet weak var fourPayerLabel: UILabel!
    @IBOutlet weak var fourPayerCurrencyLabel: UILabel!
    
    var TIP_OPTION_KEY = "tip_default_option"
    var CURRENCY_OPTION_KEY = "currency_option"
    var ROUND_OPTION_KEY = "round_amt_option"
    var FORMAT_OPTION = "%.2f"

    var currencySetting : String!
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let tipDefaultSetting = defaults.integer(forKey: TIP_OPTION_KEY)
        tipControl.selectedSegmentIndex = tipDefaultSetting
        if billField.text != nil {
            calculateTip(self)
        }
        currencySetting = defaults.string(forKey: CURRENCY_OPTION_KEY) ?? "$"
        tipCurrencyLabel.text = currencySetting
        totalCurrencyLabel.text = currencySetting
        twoPayerCurrencyLabel.text = currencySetting
        threePayerCurrencyLabel.text = currencySetting
        fourPayerCurrencyLabel.text = currencySetting
        billField.borderStyle = UITextBorderStyle.roundedRect
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercent = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: FORMAT_OPTION, tip)

        var totalVal = total
        let roundAmtSetting = defaults.bool(forKey: ROUND_OPTION_KEY)
        if roundAmtSetting == true {
            totalVal = round(total)
        }
        totalLabel.text = String(format: FORMAT_OPTION, totalVal)
        
        let twoPayerVal = totalVal / 2
        twoPayerLabel.text = String(format: FORMAT_OPTION, twoPayerVal)
        
        let threePayerVal = totalVal / 3
        threePayerLabel.text = String(format: FORMAT_OPTION, threePayerVal)
        
        let fourPayerVal = totalVal / 4
        fourPayerLabel.text = String(format: FORMAT_OPTION, fourPayerVal)
    }

}

