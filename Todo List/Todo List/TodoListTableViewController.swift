//
//  TodoListTableViewController.swift
//  Todo List
//
//  Created by Minho on 10/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {
    
    var toDoList: [ToDo] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDo = try? context.fetch(ToDo.fetchRequest()) as? [ToDo]{
                toDoList = coreDataToDo
                tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let toDo = toDoList[indexPath.row]
        
        if toDo.isImportant {
            if let name = toDo.name {
                cell.textLabel?.text = "❗️" + name
            }
        } else {
            cell.textLabel?.text = toDo.name
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = toDoList[indexPath.row]
        
        performSegue(withIdentifier: "goToItem", sender: selectedItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDoItemVC = segue.destination as? ToDoItemViewController {
            if let selectedItem = sender as? ToDo {
                toDoItemVC.todoItem = selectedItem
            }
        }
    }
    
}
