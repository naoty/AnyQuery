//
//  RecipeRepository.swift
//  Example
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import AnyQuery

protocol RecipeRepository {
    func find(id: UInt) -> Recipe?
    func findAll() -> [Recipe]
    func findAll(query query: AnyQuery?) -> [Recipe]
    func save(recipes: [Recipe])
    func delete(recipes: [Recipe])
}

extension RecipeRepository {
    func find(id: UInt) -> Recipe? {
        fatalError("Not implemented")
    }
    
    func findAll() -> [Recipe] {
        return findAll(query: .None)
    }
    
    func findAll(query query: AnyQuery?) -> [Recipe] {
        fatalError("Not implemented")
    }
    
    func save(recipes: [Recipe]) {
        fatalError("Not implemented")
    }
    
    func delete(recipes: [Recipe]) {
        fatalError("Not implemented")
    }
}
