//
//  BaseCoreDataManager.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation
import CoreData
import UIKit

class BaseCoreDataManager<T: NSManagedObject> {

    internal let managedContext: NSManagedObjectContext

    internal var entityName: String {
        return "\(T.self)"
    }

    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }

    @discardableResult
    internal func getAllObjects(with predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T]? {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        if let sortDescriptors = sortDescriptors {
            fetchRequest.sortDescriptors = sortDescriptors
        }
        do {
            return try managedContext.fetch(fetchRequest)
        } catch {
            return nil
        }
    }

    @discardableResult
    internal func deleteObjectFirst(predicate: NSPredicate) -> Bool {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate

        do {
            let tasks = try managedContext.fetch(fetchRequest)
            if let first = tasks.first {
                managedContext.delete(first)
            }
            return saveContext()
        } catch {
            return false
        }
    }

    @discardableResult
    internal func deleteObjectLast(predicate: NSPredicate) -> Bool {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate

        do {
            let tasks = try managedContext.fetch(fetchRequest)
            if let first = tasks.last {
                managedContext.delete(first)
            }
            return saveContext()
        } catch {
            return false
        }
    }

    @discardableResult
    internal func deleteObjects(predicate: NSPredicate) -> Bool {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        fetchRequest.predicate = predicate

        do {
            let tasks = try managedContext.fetch(fetchRequest)

            for task in tasks {
                managedContext.delete(task)
            }
            return saveContext()
        } catch {
            return false
        }
    }

    @discardableResult
    internal func deleteAllObject() -> Bool {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        do {
            let tasks = try managedContext.fetch(fetchRequest)
            for task in tasks {
                managedContext.delete(task)
            }
            return saveContext()
        } catch {
            return false
        }
    }

    @discardableResult
    internal func deleteAllObjectWithBatchRequest() -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext.execute(deleteRequest)
            try managedContext.save()
            return true
        } catch {
            return false
        }
    }

    @discardableResult
    internal func saveContext() -> Bool {
        do {
            try managedContext.save()
            return true
        } catch {
            return false
        }
    }

}
