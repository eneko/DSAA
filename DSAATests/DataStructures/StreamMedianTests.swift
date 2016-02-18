//
//  StreamMedianTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/17/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class StreamMedianTests: XCTestCase {

    func testIntStreamEmpty() {
        let medianFinder = StreamMedian<Int>()
        XCTAssertNil(medianFinder.median())
    }

    func testIntStreamOne() {
        var medianFinder = StreamMedian<Int>()
        medianFinder.insert(1)
        XCTAssertEqual(medianFinder.median(), 1)
    }

    func testIntStreamOdd() {
        var medianFinder = StreamMedian<Int>()
        medianFinder.insert(1)
        medianFinder.insert(2)
        medianFinder.insert(3)
        XCTAssertEqual(medianFinder.median(), 2)
    }

    func testIntStreamEven() {
        var medianFinder = StreamMedian<Int>()
        medianFinder.insert(1)
        medianFinder.insert(2)
        medianFinder.insert(3)
        medianFinder.insert(4)
        XCTAssertEqual(medianFinder.median(), 2)
    }

    func testUnsignedStreamEmpty() {
        let medianFinder = StreamMedian<UInt32>()
        XCTAssertNil(medianFinder.median())
    }

}
