//
//  newNoteViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 6..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import RealmSwift

class NewNoteViewController : UIViewController {
    @IBOutlet weak var tf_ol_title: UITextField!
    @IBOutlet weak var tv_ol_content: UITextView!
    
    @IBAction func btn_action_save(_ sender: UIButton) {
        if(self.tf_ol_title.text == "" && self.tv_ol_content.text == "")
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
        
        let realm = try! Realm()
        let notebooks = realm.objects(R_Notebook.self)
        
        let relatednotebook = notebooks[1]//temp
        
        let newnote = R_Note()
        newnote.title = self.tf_ol_title.text!
        newnote.content = self.tv_ol_content.text!
        newnote.relatedNotebook = relatednotebook
        
        let notes = realm.objects(R_Note.self)
        
        print(notes.count)
        
        try! realm.write {
            realm.add(newnote)
        }
        
        print(notes.count)
        
        /*
        
        let managedContext = CoreDataManager.shared.getContext()
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Note",
                                                in: managedContext)!
        
        let note = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        
        // 3
        note.setValue(self.tf_ol_title.text, forKeyPath: "title")
        note.setValue(self.tv_ol_content.text, forKeyPath: "content")
        note.setValue(Date(), forKeyPath: "created_at")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        //self.dismiss(animated: false, completion: nil)
 */
        self.tabBarController?.selectedIndex = 0
    }
}
