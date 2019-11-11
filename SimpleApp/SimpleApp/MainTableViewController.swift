//
//  MainTableViewController.swift
//  SimpleApp
//
//  Created by Minho on 11/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var greetings: [Greeting] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDatas()
    }
    
    func loadDatas() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDatas = try? context.fetch(Greeting.fetchRequest()) as? [Greeting] {
                greetings = coreDatas
                tableView.reloadData()
            }
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return greetings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath)
        let greeting = greetings[indexPath.row]
        
        cell.textLabel?.text = greeting.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let selectedGreeting = greetings[indexPath.row]
            context.delete(selectedGreeting)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            loadDatas()
        }
    }
    
    @IBAction func AddGreeting(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newGreeting = Greeting(context: context)
            newGreeting.name = "Hello There!!"
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            loadDatas()
        }
    }
    
}
