//
//  PriorityQueueTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/9/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class PriorityQueueTests: XCTestCase {

    func testPriorityQueue() {
        var queue = PriorityQueue<Int>(order: .Min)
        queue.add(10)
        queue.add(1)
        queue.add(14)
        queue.add(13)
        queue.add(7)
        XCTAssertFalse(queue.isEmpty())
        XCTAssertEqual(queue.remove(), 1)
        XCTAssertEqual(queue.remove(), 7)
        XCTAssertEqual(queue.remove(), 10)
        XCTAssertEqual(queue.remove(), 13)
        XCTAssertEqual(queue.remove(), 14)
        XCTAssertTrue(queue.isEmpty())
    }

    func testEmpty() {
        var queue = PriorityQueue<Int>(order: .Max)
        XCTAssertNil(queue.remove())
        XCTAssertTrue(queue.isEmpty())
    }

    func testEmpty2() {
        var queue = PriorityQueue<Int>(order: .Max)
        for i in 0..<1000 {
            queue.add(i % 10)
        }
        XCTAssertFalse(queue.isEmpty())
        for _ in 0..<1000 {
            queue.remove()
        }
        XCTAssertTrue(queue.isEmpty())
    }

    func testMax() {
        var queue = PriorityQueue<Int>(order: .Max)
        for i in 0..<1000 {
            queue.add(i % 100)
        }
        var max = 1000
        for _ in 0..<1000 {
            guard let item = queue.remove() else {
                XCTFail()
                return
            }
            XCTAssertGreaterThanOrEqual(max, item)
            max = item
        }
    }

    func testMin() {
        var queue = PriorityQueue<Int>(order: .Min)
        for i in 0..<1000 {
            queue.add(i % 100)
        }
        var min = 0
        for _ in 0..<1000 {
            guard let item = queue.remove() else {
                XCTFail()
                return
            }
            XCTAssertLessThanOrEqual(min, item)
            min = item
        }
    }

}
