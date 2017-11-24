//
//  SearchViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 5..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import RealmSwift

class SearchViewController : UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableview: UITableView!
    
    fileprivate var searchednotesarray:[R_Note] = [R_Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.register(NotebookTableViewCell.self, forCellReuseIdentifier: "notebook cell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        //loadSearchedNotes()
    }
    override func viewDidAppear(_ animated: Bool) {
        loadSearchedNotes()
    }
    
    func loadSearchedNotes() {
        searchednotesarray = [R_Note]()
        
        let realm = try! Realm()
        let results = realm.objects(R_Note.self)
        print(results.count)
        for i in 0..<results.count {
            let item = results[i]
            searchednotesarray.append(item)
        }
        
        /*
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theDog = realm.objects(Dog.self).filter("age == 1").first
                try! realm.write {
                    theDog!.age = 3
                }
            }
        }*/
        
        /*
        let fetchRequest: NSFetchRequest<Note> = Note.fetchRequest()
        do {
            // 결과값 담기
            let searchResults = try CoreDataManager.shared.getContext().fetch(fetchRequest)
            // for 문을 이용하여 Key 값에 대한 Value 값 가져오기
            for note in searchResults as [NSManagedObject] {
                let value = String(describing: note.value(forKey: "title"))
                print("\(value)")
                let newitem = NoteItem()
                newitem.title = note.value(forKey: "title") as! String
                searchednotesarray.append(newitem)
            }
        } catch {
            print("Error with request: \(error)")
        }*/
        
        
        self.tableview.reloadData()
    }
}

extension SearchViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchednotesarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SearchedNoteTableViewCell = self.tableview.dequeueReusableCell(withIdentifier: "searchednote cell", for: indexPath) as! SearchedNoteTableViewCell
        if searchednotesarray.count > indexPath.row {
            let currentitem = searchednotesarray[indexPath.row]
            print(indexPath.row)
            print(currentitem.title)
            cell.label_ol_title?.text = currentitem.title
            cell.label_ol_content?.text = currentitem.content
        }
        
        return cell
    }

}
