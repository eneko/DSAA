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
        print(heap.heap)
        XCTAssertFalse(heap.isEmpty())
        XCTAssertEqual(heap.removeMin(), 1)
        print(heap.heap)
        XCTAssertEqual(heap.removeMin(), 7)
        print(heap.heap)
        XCTAssertEqual(heap.removeMin(), 10)
        print(heap.heap)
        XCTAssertEqual(heap.removeMin(), 13)
        print(heap.heap)
        XCTAssertEqual(heap.removeMin(), 14)
        print(heap.heap)
        XCTAssertTrue(heap.isEmpty())
    }

}
