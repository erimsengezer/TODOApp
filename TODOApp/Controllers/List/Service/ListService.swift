//
//  ListService.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListServiceProtocol: AnyObject {
    typealias SuccessHandler = ([TodoModel]) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func fetchTodos(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
    func deleteTodo(todoModel: TodoModel, success: @escaping () -> Void, failure: @escaping () -> Void)
    func createTodo(parameters: CreateTodoParameters, success: @escaping () -> Void, failure: @escaping () -> Void)
}

class ListService: ListServiceProtocol {
    
    let dataManager: TodoListCoreDataManager
    
    init(dataManager: TodoListCoreDataManager) {
        self.dataManager = dataManager
    }
    
    
    func fetchTodos(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        dataManager.fetchAllTodosData(success: { response in
            success(response)
        }, failure: { error in
            failure(error)
        })
    }
    
    func deleteTodo(todoModel: TodoModel, success: @escaping () -> Void, failure: @escaping () -> Void) {
        dataManager.deleteTodo(todo: todoModel) {
            success()
        } failure: {
            failure()
        }
    }
    
    func createTodo(parameters: CreateTodoParameters, success: @escaping () -> Void, failure: @escaping () -> Void) {
        dataManager.createTodo(parameters: parameters) {
            success()
        } failure: {
            failure()
        }

    }
}
