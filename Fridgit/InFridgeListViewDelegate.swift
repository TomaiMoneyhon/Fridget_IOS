//
//  InFridgeListViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 31/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

//protocol FromFridgeListProtocol: class {
//    func sendtoShoppingList(toSave: Ingredient)
//    func openEditPopOver(toEdit: Ingredient, atIndex: Int)
//}

class InFridgeListViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var fridgeList = [Ingredient]()
    let cellIdentifier = "FridgeCustomListCell"
    
    weak var fromFridgeListProtocol : FromFridgeListProtocol?
    
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
        
        let selectedIngredient = fridgeList[indexPath.row]
        
        let undo = UITableViewRowAction(style: .Normal, title: "Undo") { action, index in
            print("undo button tapped")
            
            self.fridgeList.removeAtIndex(indexPath.row)
            self.fromFridgeListProtocol?.sendtoShoppingList(selectedIngredient)
            tableView.reloadData()
        }
        undo.backgroundColor = UIColor.greenColor()
        
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") { action, index in
            print("edit button tapped")
            
            self.fromFridgeListProtocol?.openEditPopOver(selectedIngredient, atIndex: indexPath.row)
        }
        edit.backgroundColor = UIColor.redColor()
        
        return [undo, edit]
        
    }
    
    func addToFridgeList(toAdd: Ingredient) {
        fridgeList.append(toAdd)
    }
    
    func deletefromFridgeList(atIndex: Int){
        fridgeList.removeAtIndex(atIndex)
    }

}
