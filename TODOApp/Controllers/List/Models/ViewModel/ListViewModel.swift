//
//  ListViewModel.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

struct ListViewModel {
    
    private var response: [TodoModel]
    
    var numberOfItems: Int {
        return response.count
    }
    
    mutating func deleteItem(row: Int) {
        response.remove(at: row)
    }
    
    func getTodoModel(with row: Int) -> TodoModel {
        return response[row]
    }
    
    func getID(with row: Int) -> UUID? {
        guard let id = response[row].id else { return nil }
        return id
    }
    
    func getTitle(with row: Int) -> String {
        return response[row].title ?? ""
    }
    
    init(with response: [TodoModel]) {
        self.response = response
    }
}
