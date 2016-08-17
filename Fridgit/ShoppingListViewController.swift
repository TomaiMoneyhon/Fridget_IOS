//
//  ShoppingListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, EditProtocol,SaveNewIngredientProtocol, FromShoppingListProtocol, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    let shoppingListDelegate = ShoppingListTableViewDelegate()
    var inFridgeVC : InFridgeListViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FOR TESTING
        //shoppingListDelegate.addToShoppingList(Ingredient(name: "eggs", amount: 12, amountKind: amounts.Unit))
        
        let barViewControllers = self.tabBarController?.viewControllers
        inFridgeVC = barViewControllers![1].childViewControllers[0] as! InFridgeListViewController

        inFridgeVC.loadViewIfNeeded()
        
        shoppingListTableView.dataSource = shoppingListDelegate
        shoppingListTableView.delegate = shoppingListDelegate
        shoppingListDelegate.fromShoppingListProtocol = self
        shoppingListDelegate.loadIngredients()
    }
    
    override func viewWillAppear(animated: Bool) {
        shoppingListDelegate.loadIngredients()
        shoppingListTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func saveToShoppingList(toSave: Ingredient) {
        shoppingListDelegate.addToShoppingList(toSave)
        shoppingListTableView.reloadData()
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
        VC.editDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
    }
    
    func showNoAmountAlert(toEdit: Ingredient, atIndex: Int) {
        
        let alert = storyboard!.instantiateViewControllerWithIdentifier(IDs.NoAmountPopoverViewStoryboardID) as! NoAmountPopoverViewController
        
        alert.ingredientToEdit = toEdit
        alert.itemIndex = atIndex
        alert.editDelegate = self
        alert.fromShoppingdelegate = self
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func popoverPresentationController(popoverPresentationController: UIPopoverPresentationController, willRepositionPopoverToRect rect: UnsafeMutablePointer<CGRect>, inView view: AutoreleasingUnsafeMutablePointer<UIView?>) {
        let x = popoverPresentationController.presentingViewController.view.center
        let newRect = CGRectMake(x.x, x.y, 0, 0)
        rect.initialize(newRect)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case Identifiers.toRecipeListFromShoppingSegue:
            let recipeListViewController = segue.destinationViewController as! RecipeListViewController
            recipeListViewController.inFridgeList = inFridgeVC.inFridgeListDelegate.fridgeList
            
        case Identifiers.toAddIngredientSegue:
             let saveViewContoller = segue.destinationViewController as! AddIngredientViewController
            saveViewContoller.saveDelegate = self
        default:
            return
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        switch identifier {
        case Identifiers.toRecipeListFromShoppingSegue:
            if inFridgeVC.inFridgeListDelegate.fridgeList.count == 0 {
                let alert =  UIAlertController(title: "Your fridge is empty", message: "You don't have anything in your fridge", preferredStyle: .Alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                
                alert.addAction(okAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
                    return false
                //TODO Add alert "you dont have anything in your fridge"
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
