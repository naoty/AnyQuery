//
//  AnyQueryTests.swift
//  AnyQueryTests
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import XCTest
@testable import AnyQuery

class AnyQueryTests: XCTestCase {
    func testEqual() {
        let query = AnyQuery.Equal(key: "id", value: 1)
        let expected = NSPredicate(format: "id == 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testNotEqual() {
        let query = AnyQuery.NotEqual(key: "id", value: 1)
        let expected = NSPredicate(format: "id != 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testGreaterThan() {
        let query = AnyQuery.GreaterThan(key: "id", value: 1)
        let expected = NSPredicate(format: "id > 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testGreaterThanOrEqual() {
        let query = AnyQuery.GreaterThanOrEqual(key: "id", value: 1)
        let expected = NSPredicate(format: "id >= 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testLessThan() {
        let query = AnyQuery.LessThan(key: "id", value: 1)
        let expected = NSPredicate(format: "id < 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testLessThanOrEqual() {
        let query = AnyQuery.LessThanOrEqual(key: "id", value: 1)
        let expected = NSPredicate(format: "id <= 1")
        XCTAssertEqual(query.predicate, expected)
    }
    
    func testBetween() {
        let query = AnyQuery.Between(key: "id", lhs: 1, rhs: 10)
        let expected = NSPredicate(format: "id BETWEEN { 1, 10 }")
        XCTAssertEqual(query.predicate, expected)
    }
}
