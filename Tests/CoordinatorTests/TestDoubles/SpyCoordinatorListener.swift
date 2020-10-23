//
//  SpyCoordinatorListener.swift
//  Coordinator
//
//  Created by Duy Tran on 10/23/20.
//

import Foundation
@testable import Coordinator

final class SpyCoordinatorListener: CoordinatorListener {

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
