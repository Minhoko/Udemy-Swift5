//
//  ViewController.swift
//  My first app
//
//  Created by Minho on 4/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centralLabel: UILabel!
    
    var countNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        centralLabel.text = String(countNum);
    }
    
    
    @IBAction func tapButton(_ sender: Any) {
        countNum += 1;
        
        if (countNum >= 10) {
            view.backgroundColor = UIColor.orange;
        }
        centralLabel.text = String(countNum);
    }


}

