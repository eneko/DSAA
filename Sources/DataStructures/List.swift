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

public struct List<T: Equatable> : Equatable {

    var firstItem: Item<T>?

    public mutating func append(element: T) {
        guard var item = firstItem else {
            firstItem = Item<T>(value: element)
            return
        }
        while true {
            guard let next = item.next else {
                item.next = Item<T>(value: element)
                break
            }
            item = next
        }
    }

    public mutating func insertAt(index: UInt, element: T) {
        if index == 0 {
            let newItem = Item<T>(value: element)
            newItem.next = firstItem
            firstItem = newItem
        } else if let item = itemAt(index - 1) {
            let newItem = Item<T>(value: element)
            newItem.next = item.next
            item.next = newItem
        }
    }

    public func first() -> T? {
        return firstItem?.value
    }

    public func last() -> T? {
        guard var item = firstItem else {
            return nil
        }
        var value: T? = nil
        while true {
            guard let next = item.next else {
                value = item.value
                break
            }
            item = next
        }
        return value
    }

    func itemAt(index: UInt) -> Item<T>? {
        var current: UInt = 0
        var item = firstItem
        while current < index {
            guard let next = item?.next else {
                return nil
            }
            item = next
            current++
        }
        return item
    }

    public func elementAt(index: UInt) -> T? {
        return itemAt(index)?.value
    }

    public mutating func removeFirst() -> T? {
        let value = firstItem?.value
        firstItem = firstItem?.next
        return value
    }

    public mutating func removeLast() -> T? {
        if firstItem?.next == nil {
            let value = firstItem?.value
            firstItem = nil
            return value
        }

        var item = firstItem
        var value: T? = nil
        while true {
            if item?.next?.next == nil {
                value = item?.next?.value
                item?.next = nil
                break
            }
            item = item?.next
        }
        return value
    }

    public mutating func removeAt(index: UInt) -> T? {
        if index == 0 {
            return removeFirst()
        }
        let item = itemAt(index - 1)
        let value = item?.next?.value
        item?.next = item?.next?.next
        return value
    }

    public func count() -> UInt {
        guard var item = firstItem else {
            return 0
        }
        var count: UInt = 1
        while true {
            guard let next = item.next else {
                break
            }
            item = next
            count++
        }
        return count
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
                break
            }
            item.next = next.next
            next.next = head
            head = next
        }
    }

    public func copy() -> List<T> {
        var newList = List<T>()
        var item = firstItem
        while let value = item?.value {
            newList.append(value)
            item = item?.next
        }
        return newList
    }

}

public func == <T: Equatable> (lhs: List<T>, rhs: List<T>) -> Bool {
    let leftCount = lhs.count()
    let rightCount = rhs.count()
    if leftCount != rightCount {
        return false
    }
    for i in 0..<leftCount {
        if lhs.elementAt(i) != rhs.elementAt(i) {
            return false
        }
    }
    return true
}
