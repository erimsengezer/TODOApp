//
//  ListTableViewDataSource.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

class ListTableViewDataSource: NSObject {
    private weak var output: ListTableViewDelegateOutput?
    private var viewModel: ListViewModel?
    
    init(with output: ListTableViewDelegateOutput) {
        self.output = output
    }
    
    func update(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
}

extension ListTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.getTitle(with: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let todoModel = viewModel?.getTodoModel(with: indexPath.row) else { return }
            viewModel?.deleteItem(row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            output?.deleteRow(todoModel: todoModel)
        }
    }
}
