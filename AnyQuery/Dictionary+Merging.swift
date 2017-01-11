//
//  Dictionary+Merging.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/25/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

extension Dictionary {
    func merged(_ another: [Key: Value]) -> [Key: Value] {
        var result: [Key: Value] = [:]
        for (key, value) in self {
            result[key] = value
        }
        for (key, value) in another {
            result[key] = value
        }
        return result
    }
}

extension Dictionary where Value: RangeReplaceableCollection {
    func merged(_ another: [Key: Value]) -> [Key: Value] {
        var result: [Key: Value] = [:]
        for (key, value) in self {
            result[key] = value
        }
        for (key, value) in another {
            if let collection = result[key] {
                result[key] = collection + value
            } else {
                result[key] = value
            }
        }
        return result
    }
}
