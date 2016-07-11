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
    case Equal(key: String, value: AnyObject)
    case NotEqual(key: String, value: AnyObject)
    case GreaterThan(key: String, value: AnyObject)
    case GreaterThanOrEqual(key: String, value: AnyObject)
    case LessThan(key: String, value: AnyObject)
    case LessThanOrEqual(key: String, value: AnyObject)
    case In(key: String, values: [AnyObject])
    case Between(key: String, lhs: AnyObject, rhs: AnyObject)
    
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
        case .In(let key, let values):
            let joinedValues = values.map { String($0) }.joinWithSeparator(",")
            return NSPredicate(format: "\(key) IN { \(joinedValues) }")
        case .Between(let key, let lhs, let rhs):
            return NSPredicate(format: "\(key) BETWEEN { \(lhs), \(rhs) }")
        }
    }
    
    public var dictionary: [String: AnyObject] {
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
        case .In(let key, let values):
            return [key: values]
        case .Between(let key, let lhs, _):
            return [key: lhs]
        }
    }
}

public func && (lhs: AnyQuery, rhs: AnyQuery) -> AnyQuery {
    return AnyQuery.Tree(lhs: lhs, logic: .And, rhs: rhs)
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
    return AnyQuery.Tree(lhs: lhs, logic: .Or, rhs: rhs)
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
