//
//  AnySort.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/25/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

indirect public enum AnySort {
    case tree(lhs: AnySort, rhs: AnySort)
    case ascending(key: String)
    case descending(key: String)
    
    public var sortDescriptors: [NSSortDescriptor] {
        switch self {
        case .tree(let lhs, let rhs):
            return lhs.sortDescriptors + rhs.sortDescriptors
        case .ascending(let key):
            return [NSSortDescriptor(key: key, ascending: true)]
        case .descending(let key):
            return [NSSortDescriptor(key: key, ascending: false)]
        }
    }
    
    public var dictionary: [String: [String]] {
        switch self {
        case .tree(let lhs, let rhs):
            return lhs.dictionary.merged(rhs.dictionary)
        case .ascending(let key):
            return ["sort": [key]]
        case .descending(let key):
            return ["sort": ["-\(key)"]]
        }
    }
}

public func >(lhs: AnySort, rhs: AnySort) -> AnySort {
    return AnySort.tree(lhs: lhs, rhs: rhs)
}

public func >(lhs: AnySort?, rhs: AnySort?) -> AnySort? {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs > rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    case (nil, nil):
        return nil
    }
}

public func <(lhs: AnySort, rhs: AnySort) -> AnySort {
    return AnySort.tree(lhs: rhs, rhs: lhs)
}

public func <(lhs: AnySort?, rhs: AnySort?) -> AnySort? {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs < rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    case (nil, nil):
        return nil
    }
}
