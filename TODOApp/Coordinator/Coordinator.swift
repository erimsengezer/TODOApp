//
//  Coordinator.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol ICoordinatorPassData { }

// MARK: Coordinator
protocol Coordinator: AnyObject {

    var passData: ICoordinatorPassData? { set get }

    func start()

}

extension Coordinator {

    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }

    // Builder pattern
    @discardableResult
    func with(passData: ICoordinatorPassData) -> Coordinator {
        self.passData = passData
        return self
    }

    func castPassData<T: ICoordinatorPassData>(_ type: T.Type) -> T {
        guard let passData = passData as? T else { fatalError("undefined pass data struct -> \(T.self)") }
        return passData
    }
}

// MARK: RootableCoordinator
class RootableCoordinator: NSObject, Coordinator {

    internal var passData: ICoordinatorPassData?

    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    deinit {
        print("killed: \(type(of: self))")
    }

    func start() {
        fatalError("Start method should be implemented.")
    }
}


// MARK: PresentationCoordinator
class PresentationCoordinator: NSObject, Coordinator {

    deinit {
        print("killed: \(type(of: self))")
    }


    internal var passData: ICoordinatorPassData?

    weak var presenterViewController: UIViewController?

    init(presenterViewController: UIViewController?) {
        self.presenterViewController = presenterViewController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

    func startPresent(targetVC: UIViewController) {
        presenterViewController?.presentViewController(targetVC)
    }

}

// MARK: NavigationCoordinator
class NavigationCoordinator: NSObject, Coordinator {

    deinit {
        print("killed: \(type(of: self))")
    }

    internal var passData: ICoordinatorPassData?

    internal let navigationController: UINavigationController
    internal var lastViewController: UIViewController? {
        return self.navigationController.lastViewController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

}
