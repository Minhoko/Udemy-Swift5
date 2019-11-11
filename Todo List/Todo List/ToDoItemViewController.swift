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
    
    var todoItem: ToDo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todoItem !== nil {
            if todoItem!.isImportant {
                if let name = todoItem?.name {
                    toDoListItemLabel.text =  "❗️" + name
                }
            } else {
                toDoListItemLabel.text = todoItem!.name
            }
        }
    }
    

    @IBAction func completeButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if todoItem !== nil {
                context.delete(todoItem!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
