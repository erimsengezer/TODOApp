//
//  ListDetailInteractor.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation


protocol ListDetailInteractorProtocol {
    var repository: ListDetailRepositoryProtocol { get }
    var output: ListDetailInteractorOutputProtocol? { get set }
    
    func getItem()
}

protocol ListDetailInteractorOutputProtocol: AnyObject {
    func didFetchListDetailSuccess(model: TodoModel)
    func didFetchListDetailFailure(error: Error)
}

class ListDetailInteractor: ListDetailInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: ListDetailRepositoryProtocol
    
    weak var output: ListDetailInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: ListDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func getItem() {
        repository.getItem { response in
            self.output?.didFetchListDetailSuccess(model: response)
        } failure: { error in
            self.output?.didFetchListDetailFailure(error: error)
        }
    }
}
