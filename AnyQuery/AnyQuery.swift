//
//  AnyQuery.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

public enum AnyQuery {
    case Equal(key: String, value: CustomStringConvertible)
    case NotEqual(key: String, value: CustomStringConvertible)
    case GreaterThan(key: String, value: CustomStringConvertible)
    case GreaterThanOrEqual(key: String, value: CustomStringConvertible)
    case LessThan(key: String, value: CustomStringConvertible)
    case LessThanOrEqual(key: String, value: CustomStringConvertible)
    case Between(key: String, lhs: CustomStringConvertible, rhs: CustomStringConvertible)
    
    public var predicate: NSPredicate {
        switch self {
        case .Equal(let key, let value):
            return NSPredicate(format: "\(key) == \(value)")
        case .NotEqual(let key, let value):
            return NSPredicate(format: "\(key) != \(value)")
        case .GreaterThan(let key, let value):
            return NSPredicate(format: "\(key) > \(value)")
        case .GreaterThanOrEqual(let key, let value):
            return NSPredicate(format: "\(key) >= \(value)")
        case .LessThan(let key, let value):
            return NSPredicate(format: "\(key) < \(value)")
        case .LessThanOrEqual(let key, let value):
            return NSPredicate(format: "\(key) <= \(value)")
        case .Between(let key, let lhs, let rhs):
            return NSPredicate(format: "\(key) BETWEEN { \(lhs), \(rhs) }")
        }
    }
}
