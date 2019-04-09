//
//  EmojiTableViewController.swift
//  Emoji Table
//
//  Created by Wonsug E on 3/27/19.
//  Copyright © 2019 Wonsug E. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    var emoji : [Emojis] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getItems()
    }
    
    func getItems() {
        
        if let context =
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataEmojis = try? context.fetch(Emojis.fetchRequest()) as? [Emojis] {
                emoji = coreDataEmojis
                tableView.reloadData()
            }
            
        }
    }//getItems
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emoji.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let item = emoji[indexPath.row]
        var combinedLabel = item.title!
        if ( item.info != "" ) {
            combinedLabel = combinedLabel + " - " + item.info!
        }
        cell.textLabel?.text = combinedLabel
    
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "deleteSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let delteVC = segue.destination as? DeleteViewController {
            delteVC.previousVC = self
            delteVC.location = sender as! Int
        }
    }

}
