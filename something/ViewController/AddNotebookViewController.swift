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
import RealmSwift

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
        
        let newnotebook = R_Notebook()
        newnotebook.name = self.tf_name_outlet.text!
       
        
        let realm = try! Realm()
        
        //let notes = realm.objects(R_Note.self)
        
        //print(notes.count)
        
        try! realm.write {
            realm.add(newnotebook)
        }
        
        self.dismiss(animated: false, completion: nil)
    }
    
}
