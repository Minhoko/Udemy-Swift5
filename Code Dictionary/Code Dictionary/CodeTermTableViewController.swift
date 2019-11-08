//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Minho on 7/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class CodeTermTableViewController: UITableViewController {
    
    let terms = ["Array", "Boolean", "Int", "Double", "String"];

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return terms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = terms[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTerm = terms[indexPath.row]
        
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let definitionVC = segue.destination as! DefinitionViewController
        let selectedTerm = sender as! String
        definitionVC.term = selectedTerm
    }

}
