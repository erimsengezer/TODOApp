//
//  ListRepository.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListRepositoryProtocol {
    typealias SuccessHandler = ([TodoModel]) -> Void
    typealias FailureHandler = (Error) -> Void
    
    var service: ListServiceProtocol { get }
    
    func fetchTodos(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
    func deleteTodo(todoModel: TodoModel, success: @escaping () -> Void, failure: @escaping () -> Void)
    func createTodo(parameters: CreateTodoParameters, success: @escaping () -> Void, failure: @escaping () -> Void)
}



class ListRepository: ListRepositoryProtocol {
    
    // MARK: - Properties
    let service: ListServiceProtocol
    
    // MARK: - Initializer
    init(service: ListServiceProtocol) {
        self.service = service
    }
    
    func fetchTodos(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.service.fetchTodos(success: { response in
            success(response)
        }, failure: failure)

    }
    
    func deleteTodo(todoModel: TodoModel, success: @escaping () -> Void, failure: @escaping () -> Void) {
        self.service.deleteTodo(todoModel: todoModel) {
            success()
        } failure: {
            failure()
        }
    }
    
    func createTodo(parameters: CreateTodoParameters, success: @escaping () -> Void, failure: @escaping () -> Void) {
        self.service.createTodo(parameters: parameters) {
            success()
        } failure: {
            failure()
        }

    }
    
}
