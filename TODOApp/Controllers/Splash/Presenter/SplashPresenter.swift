//
//  SplashPresenter.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation


protocol SplashPresenterProtocol {
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorProtocol { get }
    var coordinator: ISplashCoordinator { get }
    var viewModel: SplashViewModel? { get }

    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
}

class SplashPresenter: SplashPresenterProtocol {

    // MARK: - Public Properties
    let interactor: SplashInteractorProtocol
    let coordinator: ISplashCoordinator

    var viewModel: SplashViewModel?

    weak var view: SplashViewProtocol?

    // MARK: - Initializer
    init(interactor: SplashInteractorProtocol, coordinator: ISplashCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    // MARK: - Public Methods
    func viewDidLoad() {
        view?.printScreenName()
    }

    func viewWillAppear() {
        
    }

    func viewWillDisappear() {
        
    }

    func viewDidAppear() {
        
    }

    
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    func didFetchSplashSuccess(viewModel: SplashViewModel) {
        
    }
    
    func didFetchSplashFailure(error: Error) {
        
    }
}
