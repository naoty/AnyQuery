//
//  RecipeTableViewController.swift
//  Example
//
//  Created by Naoto Kaneko on 2/23/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit
import AnyQuery

class RecipeTableViewController: UITableViewController {
    var repository: RecipeRepository = RecipeMemoryRepository()
    private var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = AnyQuery.GreaterThan(key: "id", value: 3)
        recipes = repository.findAll(query: query)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension RecipeTableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeTableViewCell", forIndexPath: indexPath)
        
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = UIImage(named: recipe.imageName)
        
        return cell
    }
}
