//
//  Recipe.swift
//  Example
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

class Recipe: NSObject {
    let id: UInt
    let name: String
    let imageName: String
    
    init(id: UInt, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
