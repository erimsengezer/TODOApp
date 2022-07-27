//
//  ListCoordinator.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol IListCoordinator: AnyObject {
    func navigateToDetail(passData: ListDetailCoordinatorPassData)
}

final class ListCoordinator: RootableCoordinator, IListCoordinator {
    
    override func start() {
        guard let controller = ListBuilder.generate(coordinator: self) else { return }
        let navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func navigateToDetail(passData: ListDetailCoordinatorPassData) {
        let coordinator = ListDetailCoordinator(presenterViewController: window?.rootViewController).with(passData: passData)
        coordinate(to: coordinator)
    }
}

