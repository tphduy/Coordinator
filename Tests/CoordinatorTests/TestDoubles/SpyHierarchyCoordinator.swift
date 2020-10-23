//
//  SpyHierarchyCoordinator.swift
//  Coordinator
//
//  Created by Duy Tran on 10/23/20.
//

import Foundation
@testable import Coordinator

final class SpyHierarchyCoordinator: HierarchyCoordinator {

    var invokedChildrenSetter = false
    var invokedChildrenSetterCount = 0
    var invokedChildren: [Coordinator]?
    var invokedChildrenList = [[Coordinator]]()
    var invokedChildrenGetter = false
    var invokedChildrenGetterCount = 0
    var stubbedChildren: [Coordinator]! = []

    var children: [Coordinator] {
        set {
            invokedChildrenSetter = true
            invokedChildrenSetterCount += 1
            invokedChildren = newValue
            invokedChildrenList.append(newValue)
        }
        get {
            invokedChildrenGetter = true
            invokedChildrenGetterCount += 1
            return stubbedChildren
        }
    }

    var invokedListenerSetter = false
    var invokedListenerSetterCount = 0
    var invokedListener: CoordinatorListener?
    var invokedListenerList = [CoordinatorListener?]()
    var invokedListenerGetter = false
    var invokedListenerGetterCount = 0
    var stubbedListener: CoordinatorListener!

    var listener: CoordinatorListener? {
        set {
            invokedListenerSetter = true
            invokedListenerSetterCount += 1
            invokedListener = newValue
            invokedListenerList.append(newValue)
        }
        get {
            invokedListenerGetter = true
            invokedListenerGetterCount += 1
            return stubbedListener
        }
    }

    var invokedAdd = false
    var invokedAddCount = 0
    var invokedAddParameters: (coordinator: Coordinator, Void)?
    var invokedAddParametersList = [(coordinator: Coordinator, Void)]()

    func add(childCoordinator coordinator: Coordinator) {
        invokedAdd = true
        invokedAddCount += 1
        invokedAddParameters = (coordinator, ())
        invokedAddParametersList.append((coordinator, ()))
    }

    var invokedRemove = false
    var invokedRemoveCount = 0
    var invokedRemoveParameters: (coordinator: Coordinator, Void)?
    var invokedRemoveParametersList = [(coordinator: Coordinator, Void)]()

    func remove(childCoordinator coordinator: Coordinator) {
        invokedRemove = true
        invokedRemoveCount += 1
        invokedRemoveParameters = (coordinator, ())
        invokedRemoveParametersList.append((coordinator, ()))
    }

    var invokedStart = false
    var invokedStartCount = 0

    func start() {
        invokedStart = true
        invokedStartCount += 1
    }

    var invokedStop = false
    var invokedStopCount = 0

    func stop() {
        invokedStop = true
        invokedStopCount += 1
    }

    var invokedDidFinish = false
    var invokedDidFinishCount = 0
    var invokedDidFinishParameters: (child: Coordinator, Void)?
    var invokedDidFinishParametersList = [(child: Coordinator, Void)]()

    func didFinish(child: Coordinator) {
        invokedDidFinish = true
        invokedDidFinishCount += 1
        invokedDidFinishParameters = (child, ())
        invokedDidFinishParametersList.append((child, ()))
    }
}
