//
//  AnyQuery.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

indirect public enum AnyQuery {
    // Tree structure
    case tree(lhs: AnyQuery, logic: Logic, rhs: AnyQuery)
    
    // Basic operations
    case equal(key: String, value: Any)
    case notEqual(key: String, value: Any)
    case greaterThan(key: String, value: Any)
    case greaterThanOrEqual(key: String, value: Any)
    case lessThan(key: String, value: Any)
    case lessThanOrEqual(key: String, value: Any)
    case `in`(key: String, values: [Any])
    case between(key: String, lhs: Any, rhs: Any)
    
    public var predicate: NSPredicate {
        switch self {
        case .tree(let query1, let logic, let query2):
            switch logic {
            case .and:
                return NSCompoundPredicate(andPredicateWithSubpredicates: [query1.predicate, query2.predicate])
            case .or:
                return NSCompoundPredicate(orPredicateWithSubpredicates: [query1.predicate, query2.predicate])
            }
        case .equal(let key, let value):
            return NSPredicate(format: "\(key) == \(value)")
        case .notEqual(let key, let value):
            return NSPredicate(format: "\(key) != \(value)")
        case .greaterThan(let key, let value):
            return NSPredicate(format: "\(key) > \(value)")
        case .greaterThanOrEqual(let key, let value):
            return NSPredicate(format: "\(key) >= \(value)")
        case .lessThan(let key, let value):
            return NSPredicate(format: "\(key) < \(value)")
        case .lessThanOrEqual(let key, let value):
            return NSPredicate(format: "\(key) <= \(value)")
        case .in(let key, let values):
            let joinedValues = values.map { String(describing: $0) }.joined(separator: ",")
            return NSPredicate(format: "\(key) IN { \(joinedValues) }")
        case .between(let key, let lhs, let rhs):
            return NSPredicate(format: "\(key) BETWEEN { \(lhs), \(rhs) }")
        }
    }
    
    public var dictionary: [String: Any] {
        switch self {
        case .tree(let query1, _, let query2):
            return query1.dictionary.merged(query2.dictionary)
        case .equal(let key, let value):
            return [key: value]
        case .notEqual(let key, let value):
            return [key: value]
        case .greaterThan(let key, let value):
            return [key: value]
        case .greaterThanOrEqual(let key, let value):
            return [key: value]
        case .lessThan(let key, let value):
            return [key: value]
        case .lessThanOrEqual(let key, let value):
            return [key: value]
        case .in(let key, let values):
            return [key: values as Any]
        case .between(let key, let lhs, _):
            return [key: lhs]
        }
    }
}

public func && (lhs: AnyQuery, rhs: AnyQuery) -> AnyQuery {
    return AnyQuery.tree(lhs: lhs, logic: .and, rhs: rhs)
}

public func && (lhs: AnyQuery?, rhs: AnyQuery?) -> AnyQuery? {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs && rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    case (nil, nil):
        return nil
    }
}

public func || (lhs: AnyQuery, rhs: AnyQuery) -> AnyQuery {
    return AnyQuery.tree(lhs: lhs, logic: .or, rhs: rhs)
}

public func || (lhs: AnyQuery?, rhs: AnyQuery?) -> AnyQuery? {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs || rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    case (nil, nil):
        return nil
    }
}
