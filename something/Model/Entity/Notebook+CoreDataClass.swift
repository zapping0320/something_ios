//
//  Notebook+CoreDataClass.swift
//  something
//
//  Created by 김동현 on 2017. 11. 7..
//  Copyright © 2017년 John Kim. All rights reserved.
//
//

import Foundation
import CoreData


public class Notebook: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notebook> {
        return NSFetchRequest<Notebook>(entityName: "Notebook")
    }
    
    @NSManaged public var created_at: NSDate?
    @NSManaged public var deleted_at: NSDate?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var name: String?
    @NSManaged public var updated_at: NSDate
    
    
}

public class NotebookItem: NSObject {
    public var created_at: Date
    public var deleted_at: Date?
    public var isFavorite:Bool
    public var notebookname:String
    public var updated_at: Date
    
    override init() {
        self.isFavorite = false
        self.created_at = Date()
        self.updated_at = self.created_at
        self.deleted_at = nil
        self.notebookname = ""
        super.init()
    }
}





