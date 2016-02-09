//
//  HeapTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/8/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class HeapTests: XCTestCase {

    func testHeap() {
        var heap = Heap<Int>(order: .Min)
        heap.insert(10)
        heap.insert(1)
        heap.insert(14)
        heap.insert(13)
        heap.insert(7)
        XCTAssertFalse(heap.isEmpty())
        XCTAssertEqual(heap.remove(), 1)
        XCTAssertEqual(heap.remove(), 7)
        XCTAssertEqual(heap.remove(), 10)
        XCTAssertEqual(heap.remove(), 13)
        XCTAssertEqual(heap.remove(), 14)
        XCTAssertTrue(heap.isEmpty())
    }

    func testEmpty() {
        var heap = Heap<Int>(order: .Max)
        XCTAssertNil(heap.remove())
        XCTAssertTrue(heap.isEmpty())
    }

    func testEmpty2() {
        var heap = Heap<Int>(order: .Max)
        for i in 0..<1000 {
            heap.insert(i % 10)
        }
        XCTAssertFalse(heap.isEmpty())
        for _ in 0..<1000 {
            heap.remove()
        }
        XCTAssertTrue(heap.isEmpty())
    }

    func testMax() {
        var heap = Heap<Int>(order: .Max)
        for i in 0..<1000 {
            heap.insert(i % 100)
        }
        var max = 1000
        for _ in 0..<1000 {
            guard let item = heap.remove() else {
                XCTFail()
                return
            }
            XCTAssertGreaterThanOrEqual(max, item)
            max = item
        }
    }

    func testMin() {
        var heap = Heap<Int>(order: .Min)
        for i in 0..<1000 {
            heap.insert(i % 100)
        }
        var min = 0
        for _ in 0..<1000 {
            guard let item = heap.remove() else {
                XCTFail()
                return
            }
            XCTAssertLessThanOrEqual(min, item)
            min = item
        }
    }

}
