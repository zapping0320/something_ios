//
//  realm_noteModel.swift
//  something
//
//  Created by 김동현 on 2017. 11. 23..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import RealmSwift

class R_Note: Object  {
    dynamic var content = ""
    dynamic var created_at = Date()
    dynamic var deleted_at:Date? = nil
    dynamic var isfavorite = false
    dynamic var title = ""
    dynamic var updated_at = Date()
    //dynamic var relationship: Notebook?
    
}
