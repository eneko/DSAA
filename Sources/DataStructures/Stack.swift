//
//  Stack.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/8/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

/// Stack is an Abstract Data Type
///
/// Items are returned in LIFO order (last in, first out)
public struct Stack<T> {

    var stack: [T] = []

    /// Add an item to the stack
    /// - complexity: O(1)
    ///
    /// - parameter item: item to be added
    public mutating func push(item: T) {
        stack.append(item)
    }

    /// Remove an item from the stack
    /// - complexity: O(1)
    ///
    /// - returns: an item or nil if empty
    public mutating func pop() -> T? {
        return isEmpty() ? nil : stack.removeLast()
    }

    /// Check if the stack contains any items
    /// - complexity: O(1)
    ///
    /// - returns: true if stack is empty
    public func isEmpty() -> Bool {
        return stack.count == 0
    }

}
