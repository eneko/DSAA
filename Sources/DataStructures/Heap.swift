//
//  Heap.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/8/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

/// Max or Min Heap
public enum HeapOrder {
    case Min
    case Max
}

/// Heap is an Abstract Data Type
///
/// Order is preserved during insertion and removal of items.
public struct Heap<T:Comparable> {

    var heap: [T]
    var order: HeapOrder

    /// Instantiate a new Heap
    ///
    /// - parameter order: Indicates if the heap should be Max or Min
    public init(order: HeapOrder) {
        heap = []
        self.order = order
    }

    /// Add an item to the heap
    /// - complexity: O(log n)
    ///
    /// - parameter item: item to be added
    public mutating func insert(item: T) {
        var index = heap.count
        heap.append(item)

        while index > 0 {
            let parentIndex = (index - 1) / 2
            if order == .Min && item >= heap[parentIndex] ||
                order == .Max && item <= heap[parentIndex] {
                    break
            }
            swap(&heap[index], &heap[parentIndex])
            index = parentIndex
        }
    }

    /// Remove first element from the heap
    /// - returns: the first item on the heap (Max or Min) or nil if empty
    public mutating func remove() -> T? {
        if isEmpty() {
            return nil
        }
        if heap.count == 1 {
            return heap.removeFirst()
        }
        let item = heap.first
        heap[0] = heap.removeLast()
        reheap(0)
        return item
    }

    /// Check if the heap contains any items
    ///
    /// - returns: true if the heap is empty
    public func isEmpty() -> Bool {
        return heap.count == 0
    }

    mutating func reheap(index: Int) {
        let leftChildIndex = 2 * index + 1
        if leftChildIndex >= heap.count {
            return
        }
        var swapIndex = leftChildIndex
        let rightChildIndex = 2 * index + 2
        if rightChildIndex < heap.count &&
            isMinAndGreaterOrMaxAndLesser(leftChildIndex, indexB: rightChildIndex) {
                swapIndex = rightChildIndex
        }
        if isMinAndGreaterOrMaxAndLesser(index, indexB: swapIndex) {
                swap(&heap[index], &heap[swapIndex])
                reheap(swapIndex)
        }
    }

    func isMinAndGreaterOrMaxAndLesser(indexA: Int, indexB: Int) -> Bool {
        return order == .Min && heap[indexA] > heap[indexB] ||
                order == .Max && heap[indexA] < heap[indexB]
    }

}
