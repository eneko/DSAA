//
//  StackTests.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/8/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

import XCTest
@testable import DSAA

class StackTests: XCTestCase {

    let itemCount = 100000

    func testIntStack() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertTrue(stack.isEmpty())
    }

    func testEmpty() {
        let stack = Stack<String>()
        XCTAssertTrue(stack.isEmpty())
    }

    func testPop() {
        var stack = Stack<String>()
        XCTAssertNil(stack.pop())
    }

    func testPerformance() {
        var stack = Stack<Int>()
        self.measureBlock {
            for i in 0..<self.itemCount {
                stack.push(i)
                stack.pop()
            }
        }
        XCTAssertTrue(stack.isEmpty())
    }

    func testPerformance2() {
        var stack = Stack<Int>()
        self.measureBlock {
            for i in 0..<self.itemCount {
                stack.push(i)
            }
            for _ in 0..<self.itemCount {
                stack.pop()
            }
        }
        XCTAssertTrue(stack.isEmpty())
    }

}
