//
//  ream_notebookModel.swift
//  something
//
//  Created by 김동현 on 2017. 11. 25..
//  Copyright © 2017년 John Kim. All rights reserved.
//


import RealmSwift

class R_Notebook: Object  {
    dynamic var created_at = Date()
    dynamic var deleted_at:Date? = nil
    dynamic var isfavorite = false
    dynamic var name = ""
    dynamic var updated_at = Date()
}
