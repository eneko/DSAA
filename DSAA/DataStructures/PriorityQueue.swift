//
//  PriorityQueue.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/9/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

public enum PriorityQueueOrder {
    case Min
    case Max
}

public struct PriorityQueue<T: Comparable> {

    var queue: Heap<T>

    public init(order: PriorityQueueOrder) {
        let heapOrder = order == .Min ? HeapOrder.Min : HeapOrder.Max
        queue = Heap<T>(order: heapOrder)
    }

    public mutating func add(item: T) {
        queue.insert(item)
    }

    public mutating func remove() -> T? {
        return queue.remove()
    }

    public func isEmpty() -> Bool {
        return queue.isEmpty()
    }

}
