//
//  TodoListCoreDataManager.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 7.02.2022.
//

import Foundation

class TodoListCoreDataManager: BaseCoreDataManager<TodoModel> {
    
    func fetchAllTodosData(success: @escaping ([TodoModel]) -> Void, failure: @escaping (Error) -> Void) {
        var items = [TodoModel]()
        do {
            try items = managedContext.fetch(TodoModel.fetchRequest())
            success(items)
        } catch {
            failure(error)
        }
    }
    
    func createTodo(parameters: CreateTodoParameters, success: @escaping () -> Void, failure: @escaping () -> Void) {
        
        let newTodo = TodoModel(context: managedContext)
        newTodo.id = parameters.id
        newTodo.title = parameters.title
        newTodo.todo_description = parameters.description
        
        do {
            try managedContext.save()
            success()
        } catch {
            failure()
        }
    }
    
    func deleteTodo(todo: TodoModel, success: @escaping () -> Void, failure: @escaping () -> Void) {
        let context = managedContext
        context.delete(todo)
        
        do {
            try context.save()
            success()
        } catch {
            failure()
        }
    }
    
    func getItemById(id: UUID, success: @escaping (TodoModel) -> Void, failure: @escaping (Error) -> Void) {
        let context = managedContext
        
        // MARK: - Core Data Predicate
        
        let fetchRequest = TodoModel.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        
        do {
            guard let item = try context.fetch(fetchRequest).first else { return }
            success(item)
        } catch {
            failure(error)
        }

        // MARK: - Filter
        
        /*
            do {
                let items = try context.fetch(TodoModel.fetchRequest())
                guard let filteredItem = items.filter({$0.id == id}).first else { return }
                success(filteredItem)
            } catch {
                failure(error)
            }
         */
    }
}
