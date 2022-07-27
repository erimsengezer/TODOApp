//
//  SplashService.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol SplashServiceProtocol: AnyObject {
    typealias SuccessHandler = () -> Void
    typealias FailureHandler = (Error) -> Void
}

class SplashService: SplashServiceProtocol {
    
}
