//
//  ListPresenter.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListPresenterProtocol {
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorProtocol { get }
    var coordinator: IListCoordinator { get }
    var viewModel: ListViewModel? { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDisappear()
    func viewDidAppear()
    func deleteTodo(todoModel: TodoModel)
    func createTodo(parameters: CreateTodoParameters)
}

class ListPresenter: ListPresenterProtocol {
    
    // MARK: - Public Properties
    
    let interactor: ListInteractorProtocol
    var coordinator: IListCoordinator
    
    var viewModel: ListViewModel?
    weak var view: ListViewProtocol?
    
    // MARK: - Initializer
    init(interactor: ListInteractorProtocol, coordinator: IListCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    func viewWillAppear() {}
    func viewWillDisappear() {}
    func viewDidAppear() {}
    
    
    func viewDidLoad() {
        view?.configureNavBar()
        view?.configureTableView()
        fetchTodos()
    }
    
    func fetchTodos() {
        interactor.fetchTodos()
    }
    
    func deleteTodo(todoModel: TodoModel) {
        interactor.deleteTodo(todoModel: todoModel)
    }
    
    func createTodo(parameters: CreateTodoParameters) {
        interactor.createTodo(parameters: parameters)
    }
}


extension ListPresenter: ListInteractorOutputProtocol {
    
    func didFetchListSuccess(viewModel: ListViewModel) {
        self.viewModel = viewModel
        view?.refresh()
    }
    
    func didFetchListFailure(error: Error) {
        print("Error: \(error)")
    }
    
    func createTodoSuccess() {
        interactor.fetchTodos()
    }
    
    func createTodoFailure() {
        print("Something went wrong")
    }
    
    func deleteTodoSuccess() {
//        view?.refresh()
    }
    
    func deleteTodoFailure() {
        print("Delete Todo Failure")
    }
}
