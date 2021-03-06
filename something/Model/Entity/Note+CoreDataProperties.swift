//
//  Note+CoreDataProperties.swift
//  something
//
//  Created by 김동현 on 2017. 11. 7..
//  Copyright © 2017년 John Kim. All rights reserved.
//
//

import Foundation
import CoreData


class Note: NSManagedObject  {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var created_at: NSDate?
    @NSManaged public var deleted_at: NSDate?
    @NSManaged public var isfavorite: Bool
    @NSManaged public var title: String?
    @NSManaged public var updated_at: NSDate?
    @NSManaged public var relationship: Notebook?

}

public class NoteItem: NSObject {
    public var created_at: Date
    public var deleted_at: Date?
    public var isFavorite:Bool
    public var title:String
    public var updated_at: Date
    public var content:String
    
    override init() {
        self.isFavorite = false
        self.created_at = Date()
        self.updated_at = self.created_at
        self.deleted_at = nil
        self.title = ""
        self.content = ""
        super.init()
    }
}

