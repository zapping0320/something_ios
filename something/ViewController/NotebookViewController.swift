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
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.notebooktableview.delegate = self
        self.notebooktableview.dataSource = self
        //self.notebooktableview.reloadData()
        self.notebooktableview.register(UITableViewCell.self, forCellReuseIdentifier: "notebook cell")
        
        loadNotebooks()
    }
    
    func loadNotebooks() {
        let fetchRequest: NSFetchRequest<Notebook> = Notebook.fetchRequest()
        do {
            // 결과값 담기
            let searchResults = try CoreDataManager.shared.getContext().fetch(fetchRequest)
            // for 문을 이용하여 Key 값에 대한 Value 값 가져오기
            for notebook in searchResults as [NSManagedObject] {
                print("\(notebook.value(forKey: "name"))")
                
            }
        } catch {
            print("Error with request: \(error)")
        }
        
        
        
        notebooktableview.reloadData()
    }
}

extension NotebookViewController {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:NotebookCell = self.notebooktableview.dequeueReusableCell(withIdentifier: "notebook cell", for: indexPath) as! NotebookCell
        
        return cell
    }
}
