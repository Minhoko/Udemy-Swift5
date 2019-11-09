//
//  DefinitionViewController.swift
//  Code Dictionary
//
//  Created by Minho on 8/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    @IBOutlet weak var definitionLabel: UILabel!
    
    var term = Term()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = term.name
        definitionLabel.text = term.definition
    }

}
