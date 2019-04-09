//
//  DeleteViewController.swift
//  Emoji Table
//
//  Created by Wonsug E on 3/27/19.
//  Copyright © 2019 Wonsug E. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {
    var previousVC = EmojiTableViewController()
    var location = -1
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var infoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let toDo = previousVC.emoji[location]
        if let title = toDo.title {
            inputTextField.text = title
        }
        if let info = toDo.info {
            infoTextField.text = info
        }
    }//viewDidLoad
    
    @IBAction func editPressed(_ sender: Any) {
        if let context =
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = previousVC.emoji[location]
            context.delete(toDo)
            try? context.save()
            let todo =  Emojis(entity: Emojis.entity(), insertInto: context )
            if let titleText = inputTextField.text {
                todo.title = titleText
                if let infoText = infoTextField.text {
                    todo.info = infoText
                }
            }
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        if let context =
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = previousVC.emoji[location]
            context.delete(toDo)
            try?context.save()
        }
        
        navigationController?.popViewController(animated: true)
    }
}//DeleViewController
