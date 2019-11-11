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
    
    var ToDoListTableVC: TodoListTableViewController? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButton(_ sender: Any) {
        let newToDo = ToDoItem()
        if let name = toDoNameLabel.text {
            newToDo.name = name
            newToDo.isImportant = toDoImportantLabel.isOn
            ToDoListTableVC?.toDoList.append(newToDo)
            ToDoListTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
