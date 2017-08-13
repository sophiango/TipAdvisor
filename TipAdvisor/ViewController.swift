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

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        let tipDefaultSetting = defaults.integer(forKey: "tip_default_option")
        tipControl.selectedSegmentIndex = tipDefaultSetting
        if billField.text != nil {
            calculateTip(self)
        }
        tipCurrencyLabel.text = defaults.string(forKey: "currency_option") ?? "$"
        totalCurrencyLabel.text = defaults.string(forKey: "currency_option") ?? "$"
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
        
        tipLabel.text = String(format: "$%.2f", tip)

        var totalVal = total
        let roundAmtSetting = defaults.bool(forKey: "round_amt_option")
        if roundAmtSetting == true {
            totalVal = round(total)
        }
        totalLabel.text = String(format: "$%.2f", totalVal)
    }

}

