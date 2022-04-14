//
//  Coordinator.swift
//  Coordinator
//
//  Created by Duy Tran on 9/8/20.
//  Copyright © 2020 Duy Tran. All rights reserved.
//

import Foundation

/// An object takes the responsibility of routing through the app.
///
/// Coordinators are a design pattern that encourages decoupling view controllers such that they know as little as possible about how they are presented.
public protocol Coordinator: CoordinatorListener {
    /// An object listens to events and interactions.
    ///
    /// The listener is usually the parent coordinator.
    var listener: CoordinatorListener? { get set }
    
    /// Set up logic to manages its view controller hierarchy.
    ///
    /// This method should be called once in the entire lifetime.
    func start()
    
    /// Clean up the view its view controller hierarchy.
    ///
    /// This method should be called once in the entire lifetime.
    func stop()
}
