//
//  AnySortTests.swift
//  AnyQueryTests
//
//  Created by Naoto Kaneko on 2/25/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import XCTest
@testable import AnyQuery

class AnySortTests: XCTestCase {
    func testTree() {
        let sort1 = AnySort.ascending(key: "name")
        let sort2 = AnySort.descending(key: "age")
        let sort = AnySort.tree(lhs: sort1, rhs: sort2)
        XCTAssertEqual(sort.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "age", ascending: false)])
        XCTAssertEqual(sort.dictionary["sort"]!, ["name", "-age"])
    }
    
    func testAscending() {
        let sort = AnySort.ascending(key: "id")
        XCTAssertEqual(sort.sortDescriptors, [NSSortDescriptor(key: "id", ascending: true)])
        XCTAssertEqual(sort.dictionary["sort"]!, ["id"])
    }
    
    func testDescending() {
        let sort = AnySort.descending(key: "id")
        XCTAssertEqual(sort.sortDescriptors, [NSSortDescriptor(key: "id", ascending: false)])
        XCTAssertEqual(sort.dictionary["sort"]!, ["-id"])
    }
    
    func testGreaterThanOperator() {
        let sort = AnySort.ascending(key: "name") > AnySort.descending(key: "age")
        XCTAssertEqual(sort.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "age", ascending: false)])
        XCTAssertEqual(sort.dictionary["sort"]!, ["name", "-age"])
    }

    func testGreaterThanOperatorWithOptional() {
        let sort1 = AnySort.ascending(key: "name") > Optional.none
        XCTAssertEqual(sort1!.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true)])

        let sort2 = Optional.none > AnySort.ascending(key: "name")
        XCTAssertEqual(sort2!.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true)])
    }
    
    func testLessThanOperator() {
        let sort = AnySort.ascending(key: "name") < AnySort.descending(key: "age")
        XCTAssertEqual(sort.sortDescriptors, [NSSortDescriptor(key: "age", ascending: false), NSSortDescriptor(key: "name", ascending: true)])
        XCTAssertEqual(sort.dictionary["sort"]!, ["-age", "name"])
    }

    func testLessThanOperatorWithOptional() {
        let sort1 = AnySort.ascending(key: "name") < Optional.none
        XCTAssertEqual(sort1!.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true)])

        let sort2 = Optional.none < AnySort.ascending(key: "name")
        XCTAssertEqual(sort2!.sortDescriptors, [NSSortDescriptor(key: "name", ascending: true)])
    }
}
