//
//  ListViewController.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol ListViewProtocol: AnyObject {
    var presenter: ListPresenterProtocol { get }
    
    func configureTableView()
    func refresh()
    func configureNavBar()
}

class ListViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!
    
    let presenter: ListPresenterProtocol
    
    // MARK: - Properties
    var tableViewDelegate: ListTableViewDelegate?
    var tableViewDataSource: ListTableViewDataSource?
    
    init(presenter: ListPresenterProtocol) {
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

extension ListViewController: ListViewProtocol {
    
    func configureTableView() {
        self.tableViewDelegate = ListTableViewDelegate()
        self.tableViewDataSource = ListTableViewDataSource(with: self)
        
        tableView.delegate = self.tableViewDelegate
        tableView.dataSource = self.tableViewDataSource
        
        self.tableViewDelegate?.output = self
    }
    
    func configureNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Add Todo", message: "", preferredStyle: .alert)
        let addButton = UIAlertAction(title: "Add Todo", style: .default) { _ in
            let title = alert.textFields?.first?.text ?? "No Title"
            let description = alert.textFields?[1].text ?? "No Description"
            let parameters = CreateTodoParameters(id: UUID(), title: title, description: description)
            self.presenter.createTodo(parameters: parameters)
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Todo Title"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Todo Description"
        }
        
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func refresh() {
        guard let viewModel = presenter.viewModel else { return }
        tableViewDataSource?.update(viewModel: viewModel)
        tableView.reloadData()
    }
}

extension ListViewController: ListTableViewDelegateOutput  {
    
    func didSelectRow(at indexPath: IndexPath) {
        guard let id = presenter.viewModel?.getID(with: indexPath.row) else { return }
        let passData = ListDetailCoordinatorPassData(id: id)
        presenter.coordinator.navigateToDetail(passData: passData)
    }
    
    func deleteRow(todoModel: TodoModel) {
        presenter.deleteTodo(todoModel: todoModel)
    }
}
