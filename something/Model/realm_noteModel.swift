//
//  realm_noteModel.swift
//  something
//
//  Created by 김동현 on 2017. 11. 23..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Realm

class Note: Object {
    dynamic var name = ""
    dynamic var owner: Person? // Properties can be optional
}

