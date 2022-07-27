//
//  SplashViewController.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol SplashViewProtocol: AnyObject {
    var presenter: SplashPresenterProtocol { get }
    
    func printScreenName()
}

class SplashViewController: UIViewController {
    
    let presenter: SplashPresenterProtocol
    
    init(presenter: SplashPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
}

extension SplashViewController: SplashViewProtocol {
    func printScreenName() {
        print("------------- Splash Screen -------------")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.appDelegate.startFlowMain()
        }
    }
}
