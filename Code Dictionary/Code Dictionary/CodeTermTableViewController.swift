//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Minho on 7/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class CodeTermTableViewController: UITableViewController {
    
    var terms: [Term] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let term1 = Term()
        term1.name = "Array"
        term1.definition = "Array is Awesome"
        terms.append(term1)
        
        let term2 = Term()
        term2.name = "Boolean"
        term2.definition = "Boolean is nice"
        terms.append(term2)
        
        let term3 = Term()
        term3.name = "String"
        term3.definition = "String is useful"
        terms.append(term3)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = terms[indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTerm = terms[indexPath.row]
        
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let definitionVC = segue.destination as! DefinitionViewController
            if let selectedTerm = sender as? Term {
                definitionVC.term = selectedTerm
            }
    }

}
