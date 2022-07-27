//
//  ListDetailBuilder.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation
import UIKit

enum ListDetailBuilder {
    static func generate(data: ListDetailCoordinatorPassData, coordinator: IListDetailCoordinator) -> UIViewController? {
        let managedContext = CoreDataService.shared.persistentContainer.viewContext
        let dataManager = TodoListCoreDataManager(managedContext: managedContext)
        let service: ListDetailServiceProtocol = ListDetailService(data: data, dataManager: dataManager)
        let repository: ListDetailRepositoryProtocol = ListDetailRepository(service: service)
        var interactor: ListDetailInteractorProtocol = ListDetailInteractor(repository: repository)
        var presenter: ListDetailPresenterProtocol & ListDetailInteractorOutputProtocol = ListDetailPresenter(interactor: interactor, coordinator: coordinator)
        let view: ListDetailViewProtocol = ListDetailViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
