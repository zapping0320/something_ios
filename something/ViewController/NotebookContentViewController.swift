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
    open var selectedNotebook:R_Notebook = R_Notebook()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableview.register(NoteContentCell.self, forCellReuseIdentifier: "NoteContentCell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        loadSelectedContents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // self.navigationController?.isNavigationBarHidden = false
        loadSelectedContents()
    }

    func loadSelectedContents() {
        selectedNotebookContents = [R_Note]()
        
        let realm = try! Realm()
        let notes = realm.objects(R_Note.self).sorted(byKeyPath: "updated_at", ascending: false)
        for i in 0..<notes.count {
            let item = notes[i]
            if(item.relatedNotebook!.isSameObject(as: selectedNotebook))
            {
                selectedNotebookContents.append(item)
            }
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
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Note View") as! NoteViewController
        viewController.selectedNotebook = self.selectedNotebook
        viewController.selectedNote = selectedNotebookContents[indexPath.row]
        self.present(viewController, animated: true)
    }
        
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:NoteContentCell = self.tableview.dequeueReusableCell(withIdentifier: "NoteContentCell", for: indexPath) as! NoteContentCell
        
        let currentitem = selectedNotebookContents[indexPath.row]
        //print(indexPath.row)
        //print(currentitem.name)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        cell.label_datetime?.text = dateformatter.string(from: currentitem.updated_at)
        cell.label_title?.text = currentitem.title
        cell.label_content?.text = currentitem.content
        
        return cell
    }
}
