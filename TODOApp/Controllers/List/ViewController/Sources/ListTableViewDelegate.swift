//
//  ListTableViewDelegate.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import UIKit

protocol ListTableViewDelegateOutput: AnyObject {
    func didSelectRow(at indexPath: IndexPath)
    func deleteRow(todoModel: TodoModel)
}

class ListTableViewDelegate: NSObject {
    weak var output: ListTableViewDelegateOutput?
}

extension ListTableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
