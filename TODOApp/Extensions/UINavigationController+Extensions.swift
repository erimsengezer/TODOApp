//
//  UINavigationController+Extensions.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

extension UINavigationController {
    var lastViewController: UIViewController? {
        return viewControllers.last
    }
    
    func setRootViewController(viewController: UIViewController) {
        self.viewControllers = [viewController]
    }
}
