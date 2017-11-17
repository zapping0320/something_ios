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

class NotebookViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btn_search: UITextField!
    @IBOutlet weak var notebooktableview: UITableView!
    
    fileprivate var notebookarray:[NotebookItem] = [NotebookItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notebooktableview.register(NotebookTableViewCell.self, forCellReuseIdentifier: "notebook cell")
        self.notebooktableview.delegate = self
        self.notebooktableview.dataSource = self
        //self.notebooktableview.reloadData()
        
        
        loadNotebooks()
    }
    
    func loadNotebooks() {
        notebookarray = [NotebookItem]()
        let fetchRequest: NSFetchRequest<Notebook> = Notebook.fetchRequest()
        do {
            // 결과값 담기
            let searchResults = try CoreDataManager.shared.getContext().fetch(fetchRequest)
            // for 문을 이용하여 Key 값에 대한 Value 값 가져오기
            for notebook in searchResults as [NSManagedObject] {
                let value = String(describing: notebook.value(forKey: "name"))
                print("\(value)")
                let newitem = NotebookItem()
                newitem.notebookname = notebook.value(forKey: "name") as! String
                notebookarray.append(newitem)
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        self.notebooktableview.reloadData()
    }
}

extension NotebookViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notebookarray.count;
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        /*
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Connect BLE View") as! ConnectBLEViewController
        let itemlist = self.deviceinfolist_all[indexPath.section]
        viewController.selecteditem = itemlist![indexPath.row]
        viewController.selectedindex = indexPath.row
        self.navigationController?.pushViewController(viewController, animated: true)
 */
    }
    
    /*
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        print("setiocn :\(indexPath.section) row:\(indexPath.row)")
        return 100.0
    }*/
    //public ufnc tableView(_ tableView: UITableView, di)
    
    //public func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        /*
     
 */
    //}
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:NotebookTableViewCell = self.notebooktableview.dequeueReusableCell(withIdentifier: "notebook cell", for: indexPath) as! NotebookTableViewCell//self.notebooktableview.dequeueReusableCell(withIdentifier: "notebook cell") as! NotebookTableViewCell//(withIdentifier: "notebook cell", for: indexPath) as! NotebookCell
        let currentitem = notebookarray[indexPath.row]
        print(indexPath.row)
        print(currentitem.notebookname)
        cell.label_ol_name?.text = currentitem.notebookname
        
        
        return cell
    }
}
