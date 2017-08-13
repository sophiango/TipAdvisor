//
//  SettingsViewController.swift
//  TipAdvisor
//
//  Created by Sophia Ngo on 8/12/17.
//  Copyright © 2017 Sophia Ngo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tipDefaultSetting = defaults.integer(forKey: "tip_default_option")
        defaultTipControl.selectedSegmentIndex = tipDefaultSetting
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDefaultOption(_ sender: Any) {
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "tip_default_option")
//        defaults.set(123, forKey: "another_key_that_you_choose")
        defaults.synchronize()
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
