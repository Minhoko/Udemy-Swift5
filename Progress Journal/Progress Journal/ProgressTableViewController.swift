//
//  ProgressTableViewController.swift
//  Progress Journal
//
//  Created by Minho on 12/11/19.
//  Copyright © 2019 Minho. All rights reserved.
//

import UIKit

class ProgressTableViewController: UITableViewController {
    
    var progresses: [Progress] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDatas()
    }
    
    func loadDatas () {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDatas = try? context.fetch(Progress.fetchRequest()) as? [Progress]{
                progresses = coreDatas
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return progresses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath)
        
        let progress = progresses[indexPath.row]
        
        if let imageData = progress.image {
            cell.imageView?.image = UIImage(data: imageData)
        }
        
        cell.textLabel?.text = progress.title

        return cell
    }
    
    // Swipe deleting
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let selectedProgress = progresses[indexPath.row]
                context.delete(selectedProgress)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                loadDatas()
            }
        }
    }
    
    // Click table cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = progresses[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: selectedItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailProgressVC = segue.destination as? DetailProgressViewController {
            if let selectedProgress = sender as? Progress {
                detailProgressVC.progress = selectedProgress
            }
        }
    }

}
