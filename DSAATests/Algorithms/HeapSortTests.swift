//
//  HeapSortTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/9/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class HeapSortTests: XCTestCase {

    func testInt() {
        var array = [3,5,2,7,9,4,2]
        HeapSort.sortInPlace(&array)
        XCTAssertEqual(array, array.sort())
    }

    func testString() {
        var array = ["a", "b", "e", "c", "a", "f", "e"]
        HeapSort.sortInPlace(&array)
        XCTAssertEqual(array, array.sort())
    }

    func testRandom() {
        var array = (0..<100).map { i in arc4random_uniform(100) }
        HeapSort.sortInPlace(&array)
        XCTAssertEqual(array, array.sort())
    }

}
