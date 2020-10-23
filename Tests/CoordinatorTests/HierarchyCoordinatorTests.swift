//
//  HierarchyCoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Duy Tran on 10/23/20.
//

import XCTest
@testable import Coordinator

final class HierarchyCoordinatorTests: XCTestCase {
    
    var sut: HierarchyCoordinator!
    
    override func setUpWithError() throws {
        sut = FakeHierarchyCoordinator()
    }
    
    func testAddChild() throws {
        let coordinator = SpyCoordinator()
        sut.add(child: coordinator)
        XCTAssertTrue(coordinator.invokedListenerSetter)
        XCTAssertTrue(coordinator.invokedStart)
        XCTAssertTrue(sut.children.contains(where: { $0 === coordinator}))
    }
    
    func testRemoveChild() throws {
        let coordinator = SpyCoordinator()
        sut.remove(child: coordinator)
        XCTAssertTrue(coordinator.invokedStop)
        XCTAssertFalse(sut.children.contains(where: { $0 === coordinator}))
    }
}
