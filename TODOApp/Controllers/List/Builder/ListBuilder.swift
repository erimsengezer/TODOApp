//
//  ListBuilder.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation
import UIKit
import CoreData

enum ListBuilder {
    static func generate(coordinator: IListCoordinator) -> UIViewController? {
        let managedContext = CoreDataService.shared.persistentContainer.viewContext
        let service: ListServiceProtocol = ListService(dataManager: TodoListCoreDataManager(managedContext: managedContext))
        let repository: ListRepositoryProtocol = ListRepository(service: service)
        var interactor: ListInteractorProtocol = ListInteractor(repository: repository)
        var presenter: ListPresenterProtocol & ListInteractorOutputProtocol = ListPresenter(interactor: interactor, coordinator: coordinator)
        let view: ListViewProtocol = ListViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
