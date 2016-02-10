//
//  HeapSort.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/9/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

public struct HeapSort {

    public static func sortInPlace<T: Comparable>(inout collection: [T]) {
        var heapEndIndex = 1

        // Build a heap
        while heapEndIndex < collection.count {

            // Insert item and bubble up as needed
            var newItemIndex = heapEndIndex
            while newItemIndex > 0 {
                let parentIndex = (newItemIndex - 1) / 2
                if collection[newItemIndex] <= collection[parentIndex] {
                    break
                }
                swap(&collection[newItemIndex], &collection[parentIndex])
                newItemIndex = parentIndex
            }

            heapEndIndex++
        }

        // Extract the heap into sorted array
        heapEndIndex--
        while heapEndIndex > 0 {
            // Remove first from the heap
            swap(&collection[0], &collection[heapEndIndex])
            heapEndIndex--

            // Re-heap
            var parentIndex = 0
            while true {
                let leftChildIndex = 2 * parentIndex + 1
                if leftChildIndex > heapEndIndex {
                    break
                }
                var swapChildIndex = leftChildIndex
                let rightChildIndex = leftChildIndex + 1
                if rightChildIndex <= heapEndIndex && collection[rightChildIndex] > collection[leftChildIndex] {
                    swapChildIndex = rightChildIndex
                }
                if collection[parentIndex] >= collection[swapChildIndex] {
                    break
                }
                swap(&collection[parentIndex], &collection[swapChildIndex])
                parentIndex = swapChildIndex
            }
        }
    }
    
}
