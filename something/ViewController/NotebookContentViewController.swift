//
//  NotebookContentViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 17..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import UIKit
import RealmSwift

class NotebookContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func btn_closeNotebookContent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate var selectedNotebookContents:[R_Note] = [R_Note]()
    open var selectedindex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableview.register(NoteContentCell.self, forCellReuseIdentifier: "NoteContentCell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        loadSelectedContents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    func loadSelectedContents() {
        selectedNotebookContents = [R_Note]()
        
        let realm = try! Realm()
        let notebooks = realm.objects(R_Notebook.self)
        print(self.selectedindex)
        /*
        vr selected:R_Notebook = nil
        for j in 0..<notebooks.count {
            print(notebooks[j].name)
            if(j == self.selectedindex)
            {
                selected = notebooks[j]
            }
        }*/
        let selectedNotebook = notebooks[self.selectedindex]
        let notes = realm.objects(R_Note.self)
        print(notes.count)
        for i in 0..<notes.count {
            let item = notes[i]
            
            selectedNotebookContents.append(item)
            /*
            if(item.relatedNotebook == selectedNotebook)
            {
                selectedNotebookContents.append(item)
            }*/
            
        }
        self.tableview.reloadData()
    }
   
}

extension NotebookContentViewController {
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return selectedNotebookContents.count
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:NoteContentCell = self.tableview.dequeueReusableCell(withIdentifier: "NoteContentCell", for: indexPath) as! NoteContentCell
        
        let currentitem = selectedNotebookContents[indexPath.row]
        print(indexPath.row)
        //print(currentitem.name)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        cell.label_datetime?.text = dateformatter.string(from: currentitem.created_at)
        cell.label_title?.text = currentitem.title
        cell.label_content?.text = currentitem.content
        
        return cell
    }
}
