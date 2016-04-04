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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FOR TESTING
        //shoppingListDelegate.addToShoppingList(Ingredient(name: "eggs", amount: 12, amountKind: amounts.Unit))
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
    
    @IBAction func addPopOver(sender: UIBarButtonItem) {
        let VC = storyboard!.instantiateViewControllerWithIdentifier(IDs.addIngredientStoryboardID) as! AddIngredientViewController
        VC.saveDelegate = self
    
        presentViewController(VC, animated: true, completion: nil)
    }
    

    func saveToShoppingList(toSave: Ingredient) {
        shoppingListDelegate.addToShoppingList(toSave)
    }
    
    func saveEdit(toSave: Ingredient, atIndex: Int) {
            shoppingListDelegate.addToShoppingList(toSave)
            shoppingListDelegate.deletefromShoppingList(atIndex)
    }
    
    func sendtoFridge(toSave: Ingredient) {
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![1].childViewControllers[0] as! InFridgeListViewController
        svc.saveToFridgeList(toSave)
    }
    
    func openEditPopOver(toEdit: Ingredient, atIndex: Int) {
        
        let VC = storyboard!.instantiateViewControllerWithIdentifier(IDs.editIngredientStoryboardID) as! EditIngredientViewController
        
        VC.ingredientToEdit = toEdit
        VC.itemIndex = atIndex
        VC.saveDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
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
