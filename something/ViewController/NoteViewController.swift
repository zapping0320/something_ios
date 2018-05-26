//
//  NoteViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 5..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class NoteViewController : UIViewController {
    
    @IBOutlet weak var label_updated_at: UILabel!
    @IBOutlet weak var tf_ol_title: UITextField!
    @IBOutlet weak var tv_ol_content: UITextView!
    
    @IBOutlet weak var switch_favorite: UISwitch!
   
    open var selectedNotebook:R_Notebook = R_Notebook()
    open var selectedNote:R_Note = R_Note()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.label_updated_at.text = dateformatter.string(from: selectedNote.updated_at)
        self.switch_favorite.isOn = selectedNote.isfavorite
        self.tf_ol_title.text = selectedNote.title
        self.tv_ol_content.text = selectedNote.content
 
    }
    
    @IBAction func btn_SaveNote(_ sender: Any) {
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
        
        try! realm.write {
            selectedNote.title = self.tf_ol_title.text!
            selectedNote.content = self.tv_ol_content.text
            selectedNote.isfavorite = self.switch_favorite.isOn
            selectedNote.updated_at = Date()
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
