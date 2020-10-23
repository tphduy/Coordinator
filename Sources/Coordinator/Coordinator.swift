//
//  Coordinator.swift
//  Coordinator
//
//  Created by Duy Tran on 9/8/20.
//  Copyright © 2020 Duy Tran. All rights reserved.
//

import Foundation

/**
 The methods adopted by the object you use to listen to whether a coordinator finished.
 */
public protocol CoordinatorListener: AnyObject {
    
    /**
     Tells the listener that the child finished.
     */
    func didFinish(coordinator: Coordinator)
}

/**
 An `Coordinator` is an object that takes responsibility of how a `UIViewController` should be presented.
  - Description: Coordinators are a design pattern that encourages decoupling view controllers such that they know as little as possible about how they are presented.
 */
public protocol Coordinator: CoordinatorListener {
    
    /**
     The listener of this  `Coordinator`, it should be its parent `Coordinator`.
     */
    var listener: CoordinatorListener? { get set }
    
    /**
     The method is where the `Coordinator` executes its setup logic to manage its `UIViewController`.
     This should only be called once in the entire lifetime of the Coordinator instance.
     */
    func start()
    
    /**
     The stop method is where the Coordinator executes its clean-up logic to manage its `UIViewController`.
     This should only be called once in the entire lifetime of the Coordinator instance.
     */
    func stop()
}

/**
 An `HierarchyCoordinator` is a `Coordinator` with methods to manage its sub-flow as children.
 */
public protocol HierarchyCoordinator: Coordinator {
    
    /**
     The child `Coordinators` being managed by this `Coordinator`.
     */
    var children: [Coordinator] { get set }
    
    /**
     Add child coordinator to `childrens`.
     - parameter coordinator: `Coordinator` to add.
     */
    func add(child coordinator: Coordinator)
    
    /**
     Remove child coordinator from `childrens`
     - parameter coordinator: `Coordinator` to remove.
     */
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
