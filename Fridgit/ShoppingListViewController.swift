//
//  ShoppingListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, SaveProtocol, FromShoppingListProtocol {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    let shoppingListDelegate = ShoppingListTableViewDelegate()
    var inFridgeVC : InFridgeListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FOR TESTING
        //shoppingListDelegate.addToShoppingList(Ingredient(name: "eggs", amount: 12, amountKind: amounts.Unit))
        
        let barViewControllers = self.tabBarController?.viewControllers
        inFridgeVC = barViewControllers![1].childViewControllers[0] as! InFridgeListViewController
        inFridgeVC.loadView()
        inFridgeVC.viewDidLoad()
        
        shoppingListTableView.dataSource = shoppingListDelegate
        shoppingListTableView.delegate = shoppingListDelegate
        shoppingListDelegate.fromShoppingListProtocol = self
        if let loadedIngredient = shoppingListDelegate.loadIngredients() {
            shoppingListDelegate.shoppingList = loadedIngredient
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        shoppingListTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveToShoppingList(toSave: Ingredient) {
        shoppingListDelegate.addToShoppingList(toSave)
    }
    
    func saveEdit(toSave: Ingredient, atIndex: Int) {
            shoppingListDelegate.addToShoppingList(toSave)
            shoppingListDelegate.deletefromShoppingList(atIndex)
    }
    
    func deleteEdit(atIndex: Int) {
        shoppingListDelegate.deletefromShoppingList(atIndex)
    }
    
    func sendtoFridge(toSave: Ingredient) {
        inFridgeVC.saveToFridgeList(toSave)
    }
    
    func openEditPopOver(toEdit: Ingredient, atIndex: Int) {
        
        let VC = storyboard!.instantiateViewControllerWithIdentifier(IDs.editIngredientStoryboardID) as! EditIngredientViewController
        
        VC.ingredientToEdit = toEdit
        VC.itemIndex = atIndex
        VC.saveDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case Identifiers.toRecipeListFromShoppingSegue:
            let recipeListViewController = segue.destinationViewController as! RecipeListViewController
            
            let barViewControllers = self.tabBarController?.viewControllers
            let inFridgeVC = barViewControllers![1].childViewControllers[0] as! InFridgeListViewController
           recipeListViewController.inFridgeList = inFridgeVC.inFridgeListDelegate.fridgeList
            
        case Identifiers.toAddIngredientSegue:
             let saveViewContoller = segue.destinationViewController as! AddIngredientViewController
            saveViewContoller.saveDelegate = self
        default:
            return
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
