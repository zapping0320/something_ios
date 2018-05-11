//
//  NotebookViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 5..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import RealmSwift

class NotebookViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btn_search: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate var notebookarray:[Int:[R_Notebook]] = [Int:[R_Notebook]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.register(NotebookTableViewCell.self, forCellReuseIdentifier: "notebook body")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        loadNotebooks()
    }
    
    override func  viewDidAppear(_ animated: Bool) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)//only for simulator
        loadNotebooks()
    }
    
    func loadNotebooks() {
        notebookarray = [Int:[R_Notebook]]()
        
        var notebookarray_recent = [R_Notebook]()
        var notebookarray_all = [R_Notebook]()
        
        let realm = try! Realm()
        let results = realm.objects(R_Notebook.self)
        print(results.count)
        for i in 0..<results.count {
            let item = results[i]
            notebookarray_all.append(item)
            if(i >= results.count - 5)//pick last modified data 5 dd
            {
               notebookarray_recent.append(item)
            }
        }
        
        notebookarray[0] = notebookarray_recent
        notebookarray[1] = notebookarray_all
        
        self.tableview.reloadData()
    }
}

extension NotebookViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section > 1 || section < 0){
        return 0
        }else{
            let datalist = notebookarray[section] as [R_Notebook]!
            return datalist!.count
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "NotebookContent View") as! NotebookContentViewController
        //let itemlist = self.notebookarray[indexPath.section]
        //viewController.selecteditem = itemlist![indexPath.row]
        viewController.selectedindex = indexPath.row
        self.navigationController?.pushViewController(viewController, animated: true)
        //present(viewController, animated: true)
 
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell:NotebookTableViewCell = self.tableview.dequeueReusableCell(withIdentifier: "notebook cell", for: indexPath) as! NotebookTableViewCell
        let currentitem = notebookarray[indexPath.section]![indexPath.row] as R_Notebook
        print(indexPath.row)
        print(currentitem.name)
        cell.label_ol_name?.text = currentitem.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notebook header")!
        
        var title:String = "All Notebooks"
        if section == 0 {
            title = "Recent Notebooks"
        }
        let titleLabel = cell.viewWithTag(10) as! UILabel
        titleLabel.text = title
        
        return cell.contentView
    }
}
