//
//  TodoModel+CoreDataProperties.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//
//

import Foundation
import CoreData


extension TodoModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoModel> {
        return NSFetchRequest<TodoModel>(entityName: "TodoModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var todo_description: String?

}

extension TodoModel : Identifiable {

}
