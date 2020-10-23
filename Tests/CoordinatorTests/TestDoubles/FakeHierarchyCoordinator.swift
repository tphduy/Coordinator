//
//  FakeHierarchyCoordinator.swift
//  CoordinatorTests
//
//  Created by Duy Tran on 10/23/20.
//

import Foundation
@testable import Coordinator

final class FakeHierarchyCoordinator: HierarchyCoordinator {
    
    var children: [Coordinator] = []
    
    weak var listener: CoordinatorListener?
    
    func start() {}
    
    func stop() {}
}
