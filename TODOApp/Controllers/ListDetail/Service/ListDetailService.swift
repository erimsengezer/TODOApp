//
//  ListDetailService.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListDetailServiceProtocol: AnyObject {
    typealias SuccessHandler = (TodoModel) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func getItem(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}

class ListDetailService: ListDetailServiceProtocol {
    
    let data: ListDetailCoordinatorPassData?
    let dataManager: TodoListCoreDataManager
    
    init(data: ListDetailCoordinatorPassData, dataManager: TodoListCoreDataManager) {
        self.data = data
        self.dataManager = dataManager
    }
    
    func getItem(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        guard let id = data?.id else { return }
        dataManager.getItemById(id: id) { response in
            success(response)
        } failure: { error in
            failure(error)
        }
    }
}
