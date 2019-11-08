//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Minho on 7/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var tipResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        let billTotal = Double(billTextField.text!)!
        let tipPercent = Double(tipTextField.text!)!
        let calculatedTips = billTotal * (tipPercent / 100)
        
        tipResultLabel.text = "$\(calculatedTips)"
    }
    
}

