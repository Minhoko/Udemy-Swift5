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
    
    var term: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = term
        insertDefinitionToLabel(term: term)
    }
    
    func insertDefinitionToLabel(term: String) {
        if (term == "Array") {
            definitionLabel.text = "Array is Awesome"
        } else if (term == "Boolean") {
            definitionLabel.text = "Boolean is nice"
        } else if (term == "Int") {
            definitionLabel.text = "Int is number"
        } else if (term == "Double") {
            definitionLabel.text = "Double is cool"
        } else {
            definitionLabel.text = "String is useful"
        }
    }
    
    
}
