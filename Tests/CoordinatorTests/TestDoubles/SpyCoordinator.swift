//
//  SpyCoordinator.swift
//  Coordinator
//
//  Created by Duy Tran on 10/23/20.
//

import Foundation
@testable import Coordinator

final class SpyCoordinator: Coordinator {

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
