//
//  SplashRepository.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol SplashRepositoryProtocol {
    typealias SuccessHandler = () -> Void
    typealias FailureHandler = (Error) -> Void
    
    var service: SplashServiceProtocol { get }
}



class SplashRepository: SplashRepositoryProtocol {
    
    // MARK: - Properties
    let service: SplashServiceProtocol
    
    // MARK: - Initializer
    init(service: SplashServiceProtocol) {
        self.service = service
    }
}
