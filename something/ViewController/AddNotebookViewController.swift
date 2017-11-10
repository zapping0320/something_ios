//
//  AddNotebookViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 8..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddNotebookViewController : UIViewController {
    
    @IBOutlet weak var tf_name_outlet: UITextField!
    
    @IBAction func btn_save_action(_ sender: UIButton) {
        
        //check empty string
        if(tf_name_outlet.text == "")
        {
            let alert = UIAlertController(title: title,
                                          message: "you entered no text, please check",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelAction = UIAlertAction(title: "OK",
                                             style: .cancel, handler: nil)
            
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        //todo check duplicated
        
        //add new notebook
        
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            
            // 1
        /*
            let managedContext = (UIApplication.shared.delegate as? AppDelegate).persistentContainer.viewContext
            // 2
            let entity = NSEntityDescription.entity(forEntityName: "Notebook",
                                           in: managedContext)!
            
            let notebook = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
            
            // 3
            notebook.setValue(tf_name_outlet.text, forKeyPath: "name")
            notebook.setValue(Date(), forKeyPath: "created_at")
            
            // 4
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        */
    }
    
}
