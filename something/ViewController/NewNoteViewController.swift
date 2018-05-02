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

class NewNoteViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var tf_ol_title: UITextField!
    @IBOutlet weak var tv_ol_content: UITextView!
    @IBOutlet weak var pv_notebooks: UIPickerView!
    
    fileprivate var notebookarray_all = [R_Notebook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pv_notebooks.dataSource = self
        pv_notebooks.delegate = self
        loadNotebooks()
    }
    
    override func  viewDidAppear(_ animated: Bool) {
        loadNotebooks()
    }
    
    func loadNotebooks() {
        notebookarray_all = [R_Notebook]()
        
        let realm = try! Realm()
        let results = realm.objects(R_Notebook.self)
        print(results.count)
        for i in 0..<results.count {
            let item = results[i]
            notebookarray_all.append(item)
        }
    }
    
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
        let newnote = R_Note()
        newnote.title = self.tf_ol_title.text!
        newnote.content = self.tv_ol_content.text!
        newnote.relatedNotebook = notebookarray_all[pv_notebooks.selectedRow(inComponent: 0)]
        
        let notes = realm.objects(R_Note.self)
        
        print(notes.count)
        
        try! realm.write {
            realm.add(newnote)
        }
        
        print(notes.count)
        //clear text field
        self.tf_ol_title.text = ""
        self.tv_ol_content.text = ""
        
       self.tabBarController?.selectedIndex = 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return notebookarray_all.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return notebookarray_all[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(notebookarray_all[row].name)
    }
}
