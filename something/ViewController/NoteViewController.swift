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
    
    @IBOutlet weak var tf_ol_title: UITextField!
    @IBOutlet weak var tv_ol_content: UITextView!
    
    open var selectedNotebookindex:Int = 0
    open var selectedNoteindex:Int = 0
    fileprivate var selectedNote:R_Note = R_Note()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let notebooks = realm.objects(R_Notebook.self)
        let selectedNotebook = notebooks[self.selectedNotebookindex]
        var targetNotes = [R_Note]()
        let notes = realm.objects(R_Note.self)
        for i in 0..<notes.count {
            let item = notes[i]
            if(item.relatedNotebook!.isSameObject(as: selectedNotebook))
            {
                targetNotes.append(item)
            }
        }
        selectedNote = targetNotes[self.selectedNoteindex]
        
        self.tf_ol_title.text = selectedNote.title
        self.tv_ol_content.text = selectedNote.content
 
    }
}
