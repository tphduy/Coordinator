//
//  CoordinatorListener.swift
//  
//
//  Created by Duy Tran on 14/04/2022.
//

import Foundation

/// The methods adopted by the object you use to listen to events or interactions of a coordinator.
public protocol CoordinatorListener: AnyObject {
    /// Notifies that the sender coordinator finished.
    /// - Parameter coordinator: An object takes the responsibility of routing through the app.
    func didFinish(coordinator: Coordinator)
}

// MARK: - Default Implementation

extension CoordinatorListener {
    
    public func didFinish(coordinator: Coordinator) {
        coordinator.stop()
    }
}

extension CoordinatorListener where Self: HierarchyCoordinator {
    
    public func didFinish(coordinator: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === coordinator }) else { return }
        children[index].stop()
        children.remove(at: index)
    }
}
