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

    func testEmptyLast() {
        let list = List<Int>()
        XCTAssertNil(list.last())
    }

    func testInsert() {
        var list = List<Int>()
        list.insertAt(0, element: 1)
        list.insertAt(0, element: 2)
        list.insertAt(0, element: 3)
        XCTAssertEqual(list.first(), 3)
        XCTAssertEqual(list.elementAt(0), 3)
        XCTAssertEqual(list.elementAt(1), 2)
        XCTAssertEqual(list.elementAt(2), 1)
    }

    func testInsertMiddle() {
        var list = List<Int>()
        list.insertAt(0, element: 1)
        list.insertAt(1, element: 2)
        list.insertAt(1, element: 3)
        XCTAssertEqual(list.first(), 1)
        XCTAssertEqual(list.elementAt(0), 1)
        XCTAssertEqual(list.elementAt(1), 3)
        XCTAssertEqual(list.elementAt(2), 2)
    }

    func testInsertAtEnd() {
        var list = List<Int>()
        list.insertAt(0, element: 1)
        list.insertAt(1, element: 2)
        list.insertAt(2, element: 3)
        XCTAssertEqual(list.first(), 1)
        XCTAssertEqual(list.elementAt(0), 1)
        XCTAssertEqual(list.elementAt(1), 2)
        XCTAssertEqual(list.elementAt(2), 3)
    }

    func testEmptyRemoveFirst() {
        var list = List<Int>()
        XCTAssertNil(list.removeFirst())
    }

    func testRemoveFirst() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list.removeFirst(), 1)
        XCTAssertEqual(list.removeFirst(), 1)
        XCTAssertEqual(list.removeFirst(), 2)
        XCTAssertEqual(list.removeFirst(), 3)
        XCTAssertEqual(list.removeFirst(), 5)
        XCTAssertEqual(list.removeFirst(), 8)
        XCTAssertNil(list.removeFirst())
    }

    func testEmptyRemoveLast() {
        var list = List<Int>()
        XCTAssertNil(list.removeLast())
    }

    func testRemoveLast() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list.removeLast(), 8)
        XCTAssertEqual(list.removeLast(), 5)
        XCTAssertEqual(list.removeLast(), 3)
        XCTAssertEqual(list.removeLast(), 2)
        XCTAssertEqual(list.removeLast(), 1)
        XCTAssertEqual(list.removeLast(), 1)
        XCTAssertNil(list.removeLast())
    }

    func testRemoveAt() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        XCTAssertEqual(list.removeAt(0), 1)
        XCTAssertEqual(list.removeAt(1), 3)
        XCTAssertEqual(list.removeAt(0), 2)
        XCTAssertNil(list.removeAt(1))
    }

    func testRemoveAtEmpty() {
        var list = List<Int>()
        XCTAssertNil(list.removeAt(0))
    }

    func testCompareEqualLists() {
        var listA = List<Int>()
        listA.append(1)
        listA.append(2)
        listA.append(3)
        listA.append(4)
        var listB = List<Int>()
        listB.insertAt(0, element: 4)
        listB.insertAt(0, element: 3)
        listB.insertAt(0, element: 2)
        listB.insertAt(0, element: 1)
        XCTAssertEqual(listA, listB)
    }

    func testCompareDifferentValueLists() {
        var listA = List<Int>()
        listA.append(1)
        listA.append(2)
        listA.append(3)
        listA.append(4)
        var listB = List<Int>()
        listB.insertAt(0, element: 4)
        listB.insertAt(0, element: 4)
        listB.insertAt(0, element: 4)
        listB.insertAt(0, element: 4)
        XCTAssertNotEqual(listA, listB)
    }

    func testCompareDifferentLengthLists() {
        var listA = List<Int>()
        listA.append(1)
        listA.append(2)
        listA.append(3)
        listA.append(4)
        var listB = List<Int>()
        listB.append(1)
        listB.append(2)
        listB.append(3)
        XCTAssertNotEqual(listA, listB)
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
        XCTAssertEqual(list.elementAt(count - 2), 5)
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
        XCTAssertEqual(list.elementAt(2), 2)
        XCTAssertEqual(list.elementAt(5), 8)
        XCTAssertNil(list.elementAt(6))
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

    /// Reverse a list
    /// Source: Problem 5, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testReverse() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        list.reverse()
        XCTAssertEqual(list.elementAt(0), 8)
        XCTAssertEqual(list.elementAt(1), 5)
        XCTAssertEqual(list.elementAt(2), 3)
        XCTAssertEqual(list.elementAt(3), 2)
        XCTAssertEqual(list.elementAt(4), 1)
        XCTAssertEqual(list.elementAt(5), 1)
    }

    func testReverseEmpty() {
        var list = List<Int>()
        list.reverse()
        XCTAssertNil(list.first())
    }

    func testReverseOne() {
        var list = List<Int>()
        list.append(1)
        list.reverse()
        XCTAssertEqual(list.first(), 1)
    }

    func testCopyEmpty() {
        let list = List<Int>()
        XCTAssertEqual(list, list.copy())
    }

    func testCopy() {
        var list = List<Int>()
        list.append(1)
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(5)
        list.append(8)
        XCTAssertEqual(list, list.copy())
    }

    /// Find out whether a list is a palindrome
    /// Source: Problem 6, 99-scala problems (http://aperiodic.net/phil/scala/s-99)
    func testPalindrome() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(2)
        list.append(1)
        var copy = list.copy()
        copy.reverse()
        XCTAssertEqual(list, copy)
    }

    func testNotPalindrome() {
        var list = List<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        list.append(2)
        list.append(2)
        var copy = list.copy()
        copy.reverse()
        XCTAssertNotEqual(list, copy)
    }


}
