//
//  SettingsViewController.swift
//  TipAdvisor
//
//  Created by Sophia Ngo on 8/12/17.
//  Copyright © 2017 Sophia Ngo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var roundAmtSwitch: UISwitch!
    @IBOutlet weak var currencyPickerView: UIPickerView!

    let defaults = UserDefaults.standard
    var defaultTipSetting : Int?
    var roundAmtSetting : Bool?
    var currencySetting : String?
    var currencyPickerData = [
        "$",
        "€",
        "¥",
        "£",
        "元",
        "Bitcoin"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaultTipSetting = defaults.integer(forKey: "tip_default_option")
        defaultTipControl.selectedSegmentIndex = defaultTipSetting

        let roundAmtSetting = defaults.bool(forKey: "round_amt_option")
        roundAmtSwitch.isOn = roundAmtSetting

        let selected = defaults.string(forKey: "currency_option") ?? ""
        if let row = currencyPickerData.index(of: selected) {
            currencyPickerView.selectRow(row, inComponent: 0, animated: false)
        }
        
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(defaultTipSetting, forKey: "tip_default_option")
        defaults.set(roundAmtSetting, forKey: "round_amt_option")
        defaults.set(currencySetting, forKey: "currency_option")

        defaults.synchronize()
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView:  UIPickerView) -> Int  {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyPickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyPickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencySetting = currencyPickerData[row]
    }

    @IBAction func selectdefaultTipOption(_ sender: Any) {
        defaultTipSetting = defaultTipControl.selectedSegmentIndex
    }

    @IBAction func selectRoundAmtOption(_ sender: Any) {
        roundAmtSetting = roundAmtSwitch.isOn
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
