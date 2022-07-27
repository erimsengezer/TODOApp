//
//  SplashInteractor.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol SplashInteractorProtocol {
    var repository: SplashRepositoryProtocol { get }
    var output: SplashInteractorOutputProtocol? { get set }
    
}

protocol SplashInteractorOutputProtocol: AnyObject {
    func didFetchSplashSuccess(viewModel: SplashViewModel)
    func didFetchSplashFailure(error: Error)
}

class SplashInteractor: SplashInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: SplashRepositoryProtocol
    
    weak var output: SplashInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: SplashRepositoryProtocol) {
        self.repository = repository
    }
}

struct SplashViewModel {
    
}
