//
//  HierarchyCoordinator.swift
//  
//
//  Created by Duy Tran on 14/04/2022.
//

import Foundation

/// A `HierarchyCoordinator` is a `Coordinator` with methods to manage its sub-flow as children.
public protocol HierarchyCoordinator: Coordinator {
    /// A list of children coordinators that are managed.
    var children: [Coordinator] { get set }
    
    /// Add a coordinator as a child to manage.
    /// - Parameter coordinator: An object takes the responsibility of routing through the app.
    func add(child coordinator: Coordinator)
    
    /// Remove a coordinator from the children list.
    /// - Parameter coordinator: An object takes the responsibility of routing through the app.
    func remove(child coordinator: Coordinator)
    
}

// MARK: - Default Implementation

extension HierarchyCoordinator {
    
    public func add(child coordinator: Coordinator) {
        coordinator.listener = self
        coordinator.start()
        children.append(coordinator)
    }
    
    public func remove(child coordinator: Coordinator) {
        coordinator.stop()
        children.removeAll(where: { $0 === coordinator })
    }
}
