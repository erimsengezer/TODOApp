//
//  ListDetailCoordinator.swift
//  GetirTodo
//
//  Created by Erim Şengezer on 3.02.2022.
//

import Foundation

protocol IListDetailCoordinator: AnyObject {
    
}

struct ListDetailCoordinatorPassData: ICoordinatorPassData {
    var id: UUID
}

final class ListDetailCoordinator: PresentationCoordinator, IListDetailCoordinator {
    
    private var coordinatorData: ListDetailCoordinatorPassData { return castPassData(ListDetailCoordinatorPassData.self)}
    
    override func start() {
        guard let controller = ListDetailBuilder.generate(data: coordinatorData, coordinator: self) else { return }
        startPresent(targetVC: controller)
    }
}
