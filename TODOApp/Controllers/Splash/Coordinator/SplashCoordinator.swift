//
//  SplashCoordinator.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol ISplashCoordinator: AnyObject {
    func presentToListView()
}

final class SplashCoordinator: RootableCoordinator, ISplashCoordinator {
    override func start() {
        let controller = SplashBuilder.generate(coordinator: self)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    func presentToListView() {
        let coordinator = ListCoordinator(window: self.window)
        coordinate(to: coordinator)
    }
}
