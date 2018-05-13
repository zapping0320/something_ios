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

    func loadSelectedContents() {
        selectedNotebookContents = [R_Note]()
        
        let realm = try! Realm()
        let results = realm.objects(R_Note.self)
        print(results.count)
        for i in 0..<results.count {
            let item = results[i]
            /*
            if(item.content.contains(keyword)
                || item.title.contains(keyword)
                || keyword == "")
            {
                searchednotesarray.append(item)
            }*/
            selectedNotebookContents.append(item)
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
