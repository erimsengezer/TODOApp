//
//  SplashBuilder.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

enum SplashBuilder {
    static func generate(coordinator: ISplashCoordinator) -> UIViewController? {
        let service: SplashServiceProtocol = SplashService()
        let repository: SplashRepositoryProtocol = SplashRepository(service: service)
        var interactor: SplashInteractorProtocol = SplashInteractor(repository: repository)
        var presenter: SplashPresenterProtocol & SplashInteractorOutputProtocol = SplashPresenter(interactor: interactor, coordinator: coordinator)
        let view: SplashViewProtocol = SplashViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
