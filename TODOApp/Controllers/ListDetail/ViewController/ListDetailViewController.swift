//
//  ListDetailViewController.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol ListDetailViewProtocol: AnyObject {
    var presenter: ListDetailPresenterProtocol { get }
    
    func refresh(with todoModel: TodoModel)
}

class ListDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    
    let presenter: ListDetailPresenterProtocol
    
    init(presenter: ListDetailPresenterProtocol) {
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

extension ListDetailViewController: ListDetailViewProtocol {
    func refresh(with todoModel: TodoModel) {
        titleLabel.text = todoModel.title
        descriptionLabel.text = todoModel.todo_description
    }
}
