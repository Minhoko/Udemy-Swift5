//
//  ToDoItemViewController.swift
//  Todo List
//
//  Created by Minho on 10/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class ToDoItemViewController: UIViewController {
    @IBOutlet weak var toDoListItemLabel: UILabel!
    
    var todoItem = ToDoItem()
    var ToDoListTableVC: TodoListTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let importantMark = todoItem.isImportant ? "❗️" : ""
        toDoListItemLabel.text = "\(importantMark) \(todoItem.name)";
    }
    

    @IBAction func completeButton(_ sender: Any) {
        if let toDos = ToDoListTableVC?.toDoList {
            var index = 0;
            for item in toDos {
                if item.name == todoItem.name {
                    ToDoListTableVC?.toDoList.remove(at: index)
                    ToDoListTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    return
                } else {
                    index += 1
                }
            }
        }
        
        
        
    }
}
