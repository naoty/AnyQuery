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
    func testTree() {
        let equal1 = AnyQuery.Equal(key: "id", value: 1)
        let equal2 = AnyQuery.Equal(key: "name", value: "naoty")
        let query = AnyQuery.Tree(lhs: equal1, logic: .Or, rhs: equal2)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id == 1 OR name == naoty"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
        XCTAssertEqual(query.dictionary["name"] as? String, "naoty")
    }
    
    func testEqual() {
        let query = AnyQuery.Equal(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id == 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testNotEqual() {
        let query = AnyQuery.NotEqual(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id != 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testGreaterThan() {
        let query = AnyQuery.GreaterThan(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id > 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testGreaterThanOrEqual() {
        let query = AnyQuery.GreaterThanOrEqual(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id >= 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testLessThan() {
        let query = AnyQuery.LessThan(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id < 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testLessThanOrEqual() {
        let query = AnyQuery.LessThanOrEqual(key: "id", value: 1)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id <= 1"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testIn() {
        let query = AnyQuery.In(key: "id", values: [1, 2, 3])
        XCTAssertEqual(query.predicate, NSPredicate(format: "id IN { 1, 2, 3 }"))
        if let ids = query.dictionary["id"] as? [CustomStringConvertible] {
            XCTAssertEqual(ids[0] as? Int, 1)
            XCTAssertEqual(ids[1] as? Int, 2)
            XCTAssertEqual(ids[2] as? Int, 3)
        }
    }
    
    func testBetween() {
        let query = AnyQuery.Between(key: "id", lhs: 1, rhs: 10)
        XCTAssertEqual(query.predicate, NSPredicate(format: "id BETWEEN { 1, 10 }"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
    }
    
    func testLogicalAndOperator() {
        let query = AnyQuery.Equal(key: "id", value: 1) && AnyQuery.Equal(key: "name", value: "naoty")
        XCTAssertEqual(query.predicate, NSPredicate(format: "id == 1 AND name == naoty"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
        XCTAssertEqual(query.dictionary["name"] as? String, "naoty")
    }
    
    func testLogicalOrOperator() {
        let query = AnyQuery.Equal(key: "id", value: 1) || AnyQuery.Equal(key: "name", value: "naoty")
        XCTAssertEqual(query.predicate, NSPredicate(format: "id == 1 OR name == naoty"))
        XCTAssertEqual(query.dictionary["id"] as? Int, 1)
        XCTAssertEqual(query.dictionary["name"] as? String, "naoty")
    }
}
