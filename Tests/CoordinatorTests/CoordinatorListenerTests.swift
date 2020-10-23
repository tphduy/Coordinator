//
//  CoordinatorListenerTests.swift
//  CoordinatorTests
//
//  Created by Duy Tran on 10/23/20.
//

import XCTest
@testable import Coordinator

final class CoordinatorListenerTests: XCTestCase {
    
    func testDidFinish() {
        let child = SpyCoordinator()
        let sut = FakeCoordinatorListener()
        sut.didFinish(coordinator: child)
        XCTAssertTrue(child.invokedStop)
    }
    
    func testDidFinishWhenCoordinatorIsNotAChild() throws {
        let child = SpyCoordinator()
        let sut = FakeHierarchyCoordinator()
        XCTAssertFalse(sut.children.contains(where: { $0 === child }))
        sut.didFinish(coordinator: child)
        XCTAssertFalse(child.invokedStop)
    }
    
    func testDidFinishWhenCoordinatorIsAChild() throws {
        let child = SpyCoordinator()
        let sut = FakeHierarchyCoordinator()
        sut.add(child: child)
        XCTAssertTrue(sut.children.contains(where: { $0 === child }))
        sut.didFinish(coordinator: child)
        XCTAssertTrue(child.invokedStop)
        XCTAssertFalse(sut.children.contains(where: { $0 === child }))
    }
}
