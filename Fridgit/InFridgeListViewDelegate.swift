//
//  InFridgeListViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 31/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class InFridgeListViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var fridgeList = [Ingredient]()
    let cellIdentifier = "FridgeCustomListCell"
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridgeList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? CustomListTableViewCell
        
        if (cell == nil){
            cell = CustomListTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        let oneIngredient = fridgeList[indexPath.row]
        cell!.ingredientLabel.text = oneIngredient.name
        cell!.amountLabel.text = String(oneIngredient.amount) + " " + String(oneIngredient.amountKind)
        
        return cell!
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let undo = UITableViewRowAction(style: .Normal, title: "Undo") { action, index in
            print("more button tapped")
        }
        undo.backgroundColor = UIColor.greenColor()
        
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") { action, index in
            print("favorite button tapped")
        }
        edit.backgroundColor = UIColor.redColor()
        
        return [undo, edit]
        
    }
    
    func addToFridgeList(toAdd: Ingredient) {
        fridgeList.append(toAdd)
    }

}
