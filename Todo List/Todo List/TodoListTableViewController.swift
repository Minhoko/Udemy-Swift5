//
//  TodoListTableViewController.swift
//  Todo List
//
//  Created by Minho on 10/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var toDoList: [ToDoItem] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo1 = ToDoItem();
        todo1.name = "Buy Eggs"
        todo1.isImportant = true;
        toDoList.append(todo1)
        
        let todo2 = ToDoItem();
        todo2.name = "Walk Dog"
        toDoList.append(todo2)
        
        let todo3 = ToDoItem();
        todo3.name = "Eat Cheese"
        toDoList.append(todo3)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let importantMark = toDoList[indexPath.row].isImportant ? "❗️" : "";
        cell.textLabel?.text = "\(importantMark) \(toDoList[indexPath.row].name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = toDoList[indexPath.row]
        
        performSegue(withIdentifier: "goToItem", sender: selectedItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDoItemVC = segue.destination as? ToDoItemViewController {
            if let selectedItem = sender as? ToDoItem {
                toDoItemVC.todoItem = selectedItem
                toDoItemVC.ToDoListTableVC = self
            }
        }
        
        if let addToDoVC = segue.destination as? AddToDoViewController {
            addToDoVC.ToDoListTableVC = self
        }
        
    }
    
}
