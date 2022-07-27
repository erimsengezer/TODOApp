//
//  ListInteractor.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListInteractorProtocol {
    var repository: ListRepositoryProtocol { get }
    var output: ListInteractorOutputProtocol? { get set }
    
    func fetchTodos()
    func deleteTodo(todoModel: TodoModel)
    func createTodo(parameters: CreateTodoParameters)
}

protocol ListInteractorOutputProtocol: AnyObject {
    func didFetchListSuccess(viewModel: ListViewModel)
    func didFetchListFailure(error: Error)
    
    func deleteTodoSuccess()
    func deleteTodoFailure()
    
    func createTodoSuccess()
    func createTodoFailure()
}

class ListInteractor: ListInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: ListRepositoryProtocol
    
    weak var output: ListInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: ListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchTodos() {
        self.repository.fetchTodos(success: { [weak self] response in
            let viewModel = ListViewModel(with: response)
            self?.output?.didFetchListSuccess(viewModel: viewModel)
        }, failure: { [weak self] error in
            self?.output?.didFetchListFailure(error: error)
        })
    }
    
    func deleteTodo(todoModel: TodoModel) {
        self.repository.deleteTodo(todoModel: todoModel) {
            self.output?.deleteTodoSuccess()
        } failure: {
            self.output?.deleteTodoFailure()
        }
    }
    
    func createTodo(parameters: CreateTodoParameters) {
        self.repository.createTodo(parameters: parameters) {
            self.output?.createTodoSuccess()
        } failure: {
            self.output?.deleteTodoFailure()
        }
    }
}
