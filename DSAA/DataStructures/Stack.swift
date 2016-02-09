//
//  Stack.swift
//  DSAA
//
//  Created by Eneko Alonso on 2/8/16.
//  Copyright © 2016 Eneko Alonso. All rights reserved.
//

/// Stack is an Abstract Data Structure
///
/// Items are returned in LIFO order (last in, first out)
public struct Stack<T> {

    var stack: [T] = []

    /// Add an item to the stack
    /// - parameter value: item to be added
    public mutating func push(value: T) {
        stack.append(value)
    }

    /// Remove an item from the stack
    /// - returns: an item or nil if empty
    public mutating func pop() -> T? {
        return isEmpty() ? nil : stack.removeLast()
    }

    /// Check if the stack contains any items
    /// - returns: true if stack is empty
    public func isEmpty() -> Bool {
        return stack.count == 0
    }

}
