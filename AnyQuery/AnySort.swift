//
//  AnySort.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/25/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

indirect public enum AnySort {
    case Tree(lhs: AnySort, rhs: AnySort)
    case Ascending(key: String)
    case Descending(key: String)
    
    var sortDescriptors: [NSSortDescriptor] {
        switch self {
        case .Tree(let lhs, let rhs):
            return lhs.sortDescriptors + rhs.sortDescriptors
        case .Ascending(let key):
            return [NSSortDescriptor(key: key, ascending: true)]
        case .Descending(let key):
            return [NSSortDescriptor(key: key, ascending: false)]
        }
    }
    
    var dictionary: [String: [String]] {
        switch self {
        case .Tree(let lhs, let rhs):
            return lhs.dictionary.merged(rhs.dictionary)
        case .Ascending(let key):
            return ["sort": [key]]
        case .Descending(let key):
            return ["sort": ["-\(key)"]]
        }
    }
}

public func +(lhs: AnySort, rhs: AnySort) -> AnySort {
    return AnySort.Tree(lhs: lhs, rhs: rhs)
}