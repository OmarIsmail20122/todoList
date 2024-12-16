//
//  ToDoListItem+CoreDataProperties.swift
//  todoList
//
//  Created by Mac on 08/06/2024.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var craetedAt: Date?
    @NSManaged public var name: String?

}

extension ToDoListItem : Identifiable {

}
