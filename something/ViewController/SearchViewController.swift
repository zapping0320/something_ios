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

class SearchViewController : UIViewController, UITableViewDelegate, UITableViewDataSource ,UISearchBarDelegate {
    
    @IBOutlet weak var sb_searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
   fileprivate var searchednotesarray:[R_Note] = [R_Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableview.register(SearchedNoteTableViewCell.self, forCellReuseIdentifier: "notebook cell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.sb_searchBar.delegate = self
        
        //loadSearchedNotes()
    }
    override func viewDidAppear(_ animated: Bool) {
        //loadSearchedNotes()
    }
    
    func loadSearchedNotes(keyword:String) {
        searchednotesarray = [R_Note]()
        
        let realm = try! Realm()
        let results = realm.objects(R_Note.self)
        print(results.count)
        for i in 0..<results.count {
            let item = results[i]
           if(item.content.contains(keyword)
            || item.title.contains(keyword)
            || keyword == "")
           {
                searchednotesarray.append(item)
            }
        }
        self.tableview.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadSearchedNotes(keyword: searchText)
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
