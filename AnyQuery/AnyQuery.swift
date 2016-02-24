//
//  AnyQuery.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

indirect public enum AnyQuery {
    // Tree structure
    case Tree(lhs: AnyQuery, logic: Logic, rhs: AnyQuery)
    
    // Basic operations
    case Equal(key: String, value: CustomStringConvertible)
    case NotEqual(key: String, value: CustomStringConvertible)
    case GreaterThan(key: String, value: CustomStringConvertible)
    case GreaterThanOrEqual(key: String, value: CustomStringConvertible)
    case LessThan(key: String, value: CustomStringConvertible)
    case LessThanOrEqual(key: String, value: CustomStringConvertible)
    case Between(key: String, lhs: CustomStringConvertible, rhs: CustomStringConvertible)
    
    public var predicate: NSPredicate {
        switch self {
        case .Tree(let query1, let logic, let query2):
            switch logic {
            case .And:
                return NSCompoundPredicate(andPredicateWithSubpredicates: [query1.predicate, query2.predicate])
            case .Or:
                return NSCompoundPredicate(orPredicateWithSubpredicates: [query1.predicate, query2.predicate])
            }
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
    
    public var dictionary: [String: CustomStringConvertible] {
        switch self {
        case .Tree(let query1, _, let query2):
            return query1.dictionary.merged(query2.dictionary)
        case .Equal(let key, let value):
            return [key: value]
        case .NotEqual(let key, let value):
            return [key: value]
        case .GreaterThan(let key, let value):
            return [key: value]
        case .GreaterThanOrEqual(let key, let value):
            return [key: value]
        case .LessThan(let key, let value):
            return [key: value]
        case .LessThanOrEqual(let key, let value):
            return [key: value]
        case .Between(let key, let lhs, _):
            return [key: lhs]
        }
    }
}

public func && (lhs: AnyQuery, rhs: AnyQuery) -> AnyQuery {
    return AnyQuery.Tree(lhs: lhs, logic: .And, rhs: rhs)
}

public func || (lhs: AnyQuery, rhs: AnyQuery) -> AnyQuery {
    return AnyQuery.Tree(lhs: lhs, logic: .Or, rhs: rhs)
}
