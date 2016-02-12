//
//  List.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/11/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

/// List is an Abstract Data Type
///
/// Single linked list implementation

class Item<T> {

    var value: T
    var next: Item<T>?

    init(value: T) {
        self.value = value
    }

}

public struct List<T> {

    var firstItem: Item<T>?

    public mutating func append(element: T) {
        guard var item = firstItem else {
            firstItem = Item<T>(value: element)
            return
        }
        while true {
            guard let next = item.next else {
                item.next = Item<T>(value: element)
                return
            }
            item = next
        }
    }

    public mutating func insertAt(index: UInt, element: T) {

    }

    public func first() -> T? {
        return firstItem?.value
    }

    public func last() -> T? {
        guard var item = firstItem else {
            return nil
        }
        while true {
            guard let next = item.next else {
                return item.value
            }
            item = next
        }
    }

    public func itemAt(index: UInt) -> T? {
        var current: UInt = 0
        var item = firstItem
        while current < index {
            guard let next = item?.next else {
                return nil
            }
            item = next
            current++
        }
        return item?.value
    }

    public mutating func removeFirst() -> T? {
        return nil
    }

    public mutating func removeLast() -> T? {
        return nil
    }

    public mutating func removeAt(index: Int) -> T? {
        return nil
    }

    public func count() -> UInt {
        guard var item = firstItem else {
            return 0
        }
        var count: UInt = 1
        while true {
            guard let next = item.next else {
                return count
            }
            item = next
            count++
        }
    }

    public func isEmpty() -> Bool {
        return count() == 0
    }

    public mutating func reverse() {
        guard let item = firstItem else {
            return
        }
        var head = item
        while true {
            guard let next = item.next else {
                firstItem = head
                return
            }
            item.next = next.next
            next.next = head
            head = next
        }
    }

}

//public extension List : Equatable where T:Equatable {
//
//}

public func == <T: Equatable> (lhs: List<T>, rhs: List<T>) -> Bool {
    let leftCount = lhs.count()
    let rightCount = rhs.count()
    if leftCount != rightCount {
        return false
    }
    for i in 0..<leftCount {
        if lhs.itemAt(i) != rhs.itemAt(i) {
            return false
        }
    }
    return true
}
