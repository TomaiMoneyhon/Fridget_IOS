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
    
    weak var fromFridgeListProtocol : FromFridgeListProtocol?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fridgeList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.fridgeCellIdentifier) as? CustomListTableViewCell
        
        if (cell == nil){
            cell = CustomListTableViewCell(style: .Default, reuseIdentifier: Identifiers.fridgeCellIdentifier)
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
            
            self.deletefromFridgeList(indexPath.row)
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
        self.saveIngredients()
    }
    
    func deletefromFridgeList(atIndex: Int){
        fridgeList.removeAtIndex(atIndex)
        self.saveIngredients()
    }
    
    func saveIngredients() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(fridgeList, toFile: FileDirectories.fridgeDirectory.path!)
        if !isSuccessfulSave {
            print("Saving fridgeList Failed!")
        }
    }
    
    func loadIngredients() -> [Ingredient]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(FileDirectories.fridgeDirectory.path!) as? [Ingredient]
    }

}
