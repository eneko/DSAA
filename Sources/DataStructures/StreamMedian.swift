//
//  StreamMedian.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/17/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

//public protocol Averageable { //: FloatLiteralConvertible, IntegerArithmeticType {
//
//    public func average(
//
//}

public struct StreamMedian<T: IntegerType> {

    var leftQueue = PriorityQueue<T>(order: .Max)
    var rightQueue = PriorityQueue<T>(order: .Min)

    public mutating func insert(item: T) {
        guard let median = median() else {
            rightQueue.add(item)
            return
        }
        if item < median {
            if leftQueue.count > rightQueue.count {
                if let item = leftQueue.remove() {
                    rightQueue.add(item)
                }
            }
            leftQueue.add(item)
        } else {
            if rightQueue.count > leftQueue.count {
                if let item = rightQueue.remove() {
                    leftQueue.add(item)
                }
            }
            rightQueue.add(item)
        }
    }

    public func median() -> T? {
        let leftSize = leftQueue.count
        let rightSize = rightQueue.count
        let diff = leftSize - rightSize

        if diff > 0 {
            return leftQueue.peek()
        } else if diff < 0 {
            return rightQueue.peek()
        }

        guard let left = leftQueue.peek(), let right = rightQueue.peek() else {
            return nil
        }
        return (left + right) / 2
    }

}
