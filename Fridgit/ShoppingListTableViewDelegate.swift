//
//  ShoppinglistTableViewController.swift
//  Fridgit
//
//  Created by Admin on 23/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ShoppingListTableViewDelegate:  NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var shoppingList = [Ingredient]()
    weak var fromShoppingListProtocol : FromShoppingListProtocol?
    
    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return shoppingList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.shoppingCellIdentifier) as? CustomListTableViewCell
        
        if (cell == nil) {
            cell = CustomListTableViewCell(style: .Default, reuseIdentifier: Identifiers.shoppingCellIdentifier)
        }
        
        let oneIngredient = shoppingList[indexPath.row]
        cell!.ingredientLabel.text = oneIngredient.name
        if oneIngredient.amount == -1 {
            cell!.amountLabel.text = ""
        }else{
            cell!.amountLabel.text = String(oneIngredient.amount) + " " + String(oneIngredient.amountKind)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedIngredient = shoppingList[indexPath.row]
        
        if selectedIngredient.amount == -1 {
            fromShoppingListProtocol?.showNoAmountAlert(selectedIngredient, atIndex: indexPath.row )
        }else{
            self.deletefromShoppingList(indexPath.row)
            self.fromShoppingListProtocol?.sendtoFridge(selectedIngredient)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let selectedIngredient = shoppingList[indexPath.row]
        
        let done = UITableViewRowAction(style: .Normal, title: "Done") { action, index in
            
            if selectedIngredient.amount == -1 {
                self.fromShoppingListProtocol?.showNoAmountAlert(selectedIngredient, atIndex: indexPath.row )
            }else{
                self.deletefromShoppingList(indexPath.row)
                self.fromShoppingListProtocol?.sendtoFridge(selectedIngredient)
                tableView.reloadData()
            }
            
            
        }
        done.backgroundColor = UIColor.greenColor()
        
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") { action, index in
            
           self.fromShoppingListProtocol?.openEditPopOver(selectedIngredient, atIndex: indexPath.row)
            
        }
        edit.backgroundColor = UIColor.redColor()
        
        return [done, edit]

    }
    
    func addToShoppingList(toAdd: Ingredient) {
        shoppingList.append(toAdd)
        self.saveIngredients()
    }
    
    func deletefromShoppingList(atIndex: Int){
        shoppingList.removeAtIndex(atIndex)
        self.saveIngredients()
    }
    
    func saveIngredients() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(shoppingList, toFile: FileDirectories.shoppingDirectory.path!)
        if !isSuccessfulSave {
            print("Saving shoppingList Failed!")
        }
    }
    
    func loadIngredients() {
        if let loadedIngredients = NSKeyedUnarchiver.unarchiveObjectWithFile(FileDirectories.shoppingDirectory.path!) as? [Ingredient] {
            shoppingList = loadedIngredients
        }
        else {
            print ("loading shoppingList failed")
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
