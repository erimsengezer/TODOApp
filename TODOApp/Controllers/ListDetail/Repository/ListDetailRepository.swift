//
//  ListDetailRepository.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol ListDetailRepositoryProtocol {
    typealias SuccessHandler = (TodoModel) -> Void
    typealias FailureHandler = (Error) -> Void
    
    var service: ListDetailServiceProtocol { get }
    
    func getItem(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}



class ListDetailRepository: ListDetailRepositoryProtocol {
    
    // MARK: - Properties
    let service: ListDetailServiceProtocol
    
    // MARK: - Initializer
    init(service: ListDetailServiceProtocol) {
        self.service = service
    }
    
    func getItem(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        service.getItem { responseTodo in
            success(responseTodo)
        } failure: { error in
            failure(error)
        }

    }
}
