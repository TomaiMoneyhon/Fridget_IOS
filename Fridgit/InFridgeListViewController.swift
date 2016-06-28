//
//  InFridgeListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class InFridgeListViewController: UIViewController, FromFridgeListProtocol, EditProtocol {
    
    @IBOutlet weak var inFridgeListTableView: UITableView!
    let inFridgeListDelegate = InFridgeListViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inFridgeListTableView.dataSource = inFridgeListDelegate
        inFridgeListTableView.delegate = inFridgeListDelegate
        inFridgeListDelegate.fromFridgeListProtocol = self
        inFridgeListDelegate.loadIngredients()
    }
    
    override func viewWillAppear(animated: Bool) {
        inFridgeListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveToFridgeList(toSend: Ingredient){
        inFridgeListDelegate.addToFridgeList(toSend)
    }
    
    func editIngredientInList (toSave: Ingredient, atIndex: Int){
        inFridgeListDelegate.addToFridgeList(toSave)
        inFridgeListDelegate.deletefromFridgeList(atIndex)
        
    }
    
    func sendtoShoppingList(toSave: Ingredient) {
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![0].childViewControllers[0] as! ShoppingListViewController
        svc.saveToShoppingList(toSave)
    }
    
    func openEditPopOver(toEdit: Ingredient, atIndex: Int) {
        
        let VC = storyboard!.instantiateViewControllerWithIdentifier(IDs.editIngredientStoryboardID) as! EditIngredientViewController
        
        VC.ingredientToEdit = toEdit
        VC.itemIndex = atIndex
        VC.editDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
    }
    
    func saveEdit(toSave: Ingredient, atIndex: Int) {
        inFridgeListDelegate.addToFridgeList(toSave)
        inFridgeListDelegate.deletefromFridgeList(atIndex)
    }
    
    func deleteEdit(atIndex: Int) {
        inFridgeListDelegate.deletefromFridgeList(atIndex)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case Identifiers.toRecipeListFromFridgeSegue:
            let recipeListViewController = segue.destinationViewController as! RecipeListViewController
            recipeListViewController.inFridgeList = inFridgeListDelegate.fridgeList
        default:
            return
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        switch identifier {
        case Identifiers.toRecipeListFromFridgeSegue:
            if inFridgeListDelegate.fridgeList.count == 0 {
                return false
            }
            else {
                return true
            }
        default:
            return true
        }
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
