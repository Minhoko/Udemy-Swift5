//
//  AddToDoViewController.swift
//  Todo List
//
//  Created by Minho on 11/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var toDoNameLabel: UITextField!
    @IBOutlet weak var toDoImportantLabel: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDo(context: context)
            if let name = toDoNameLabel.text {
                newToDo.name = name
                newToDo.isImportant = toDoImportantLabel.isOn
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }

    }
    
}
