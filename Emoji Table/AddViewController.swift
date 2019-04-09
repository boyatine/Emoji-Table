//
//  AddViewController.swift
//  Emoji Table
//
//  Created by Wonsug E on 3/27/19.
//  Copyright © 2019 Wonsug E. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }//viewDidLoad
    
    @IBAction func addPressed(_ sender: Any) {
        if let context =
            (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let todo = Emojis(entity: Emojis.entity(), insertInto: context )
            if let emojiTitle = inputTextField.text {
                todo.title = emojiTitle
                if let emojiInfo = descriptionTextField.text {
                    todo.info = emojiInfo
                }
            }
            
            try? context.save()
        
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    
    
    
}//AddViewController
