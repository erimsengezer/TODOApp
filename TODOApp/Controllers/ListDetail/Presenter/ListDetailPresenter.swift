//
//  ListDetailPresenter.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListDetailPresenterProtocol {
    var view: ListDetailViewProtocol? { get set }
    var interactor: ListDetailInteractorProtocol { get }
    var coordinator: IListDetailCoordinator { get }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}


class ListDetailPresenter: ListDetailPresenterProtocol {

    // MARK: - Public Properties
    let interactor: ListDetailInteractorProtocol
    let coordinator: IListDetailCoordinator

    weak var view: ListDetailViewProtocol?

    // MARK: - Initializer
    init(interactor: ListDetailInteractorProtocol, coordinator: IListDetailCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    // MARK: - Public Methods
    func viewDidLoad() {
        self.getItem()
    }

    func viewWillAppear() {
        
    }

    func viewWillDisappear() {
        
    }

    func viewDidAppear() {
        
    }
    
    func getItem() {
        interactor.getItem()
    }
}

extension ListDetailPresenter: ListDetailInteractorOutputProtocol {
    func didFetchListDetailSuccess(model: TodoModel) {
        view?.refresh(with: model)
    }
    
    func didFetchListDetailFailure(error: Error) {
        print("Error.")
    }
}
