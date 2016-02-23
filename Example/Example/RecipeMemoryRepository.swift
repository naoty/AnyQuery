//
//  RecipeMemoryRepository.swift
//  Example
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import AnyQuery

struct RecipeMemoryRepository: RecipeRepository {
    private let recipes = [
        Recipe(id: 1, name: "ベジタブルカレー", imageName: ""),
        Recipe(id: 2, name: "すき焼き", imageName: ""),
        Recipe(id: 3, name: "みぞれ鍋", imageName: ""),
        Recipe(id: 4, name: "トマトクリームパスタ", imageName: ""),
        Recipe(id: 5, name: "鍋焼きうどん", imageName: "")
    ]
    
    func findAll(query query: AnyQuery?) -> [Recipe] {
        if let query = query {
            return recipes.filter { query.predicate.evaluateWithObject($0) }
        } else {
            return recipes
        }
    }
}
