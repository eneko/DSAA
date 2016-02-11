//
//  ListTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/11/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class ListTests: XCTestCase {

    func testEmpty() {
        let list = List<Int>()
        XCTAssertTrue(list.isEmpty())
    }

    func testEmptyCount() {
        let list = List<Int>()
        XCTAssertEqual(list.count(), 0)
    }

    func testEmptyFirst() {
        let list = List<Int>()
        XCTAssertNil(list.first())
    }

    /// Find last element on a list
    /// Source: Problem 1, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testFindLast() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list.last(), 8)
    }

    /// Find the last but one element on a list
    /// Source: Problem 2, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testFindPenultimate() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        let count = list.count()
        XCTAssertEqual(list.itemAt(count - 2), 5)
    }

    /// Find the nth element on a list
    /// Source: Problem 3, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testFindNth() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list.itemAt(2), 2)
    }

    /// Find the number of elements on a list
    /// Source: Problem 4, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testCount() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list.count(), 6)
    }

    func testReverse() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        list.reverse()
        XCTAssertEqual(list.itemAt(0), 8)
        XCTAssertEqual(list.itemAt(1), 5)
        XCTAssertEqual(list.itemAt(2), 3)
        XCTAssertEqual(list.itemAt(3), 2)
        XCTAssertEqual(list.itemAt(4), 1)
        XCTAssertEqual(list.itemAt(5), 1)
    }

}
