//
//  ChosenRecipeIngredientListViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 30/05/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChosenRecipeIngredientListViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate{

    var inFridgeList: [Ingredient]!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inFridgeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.ChosenIngredientsCustomListCell) as? CustomListTableViewCell
        
        if (cell == nil){
            cell = CustomListTableViewCell(style: .Default, reuseIdentifier: Identifiers.ChosenIngredientsCustomListCell)
        }
        
        return cell!
    }
    
    
}
