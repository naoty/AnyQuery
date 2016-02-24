//
//  Dictionary+Merging.swift
//  AnyQuery
//
//  Created by Naoto Kaneko on 2/25/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

extension Dictionary {
    func merged(another: Dictionary) -> Dictionary {
        var result: Dictionary = [:]
        for (key, value) in self {
            result[key] = value
        }
        for (key, value) in another {
            result[key] = value
        }
        return result
    }
}
