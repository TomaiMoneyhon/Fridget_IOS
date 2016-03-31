//
//  ShoppingListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, SaveProtocol {
    
    
    @IBOutlet weak var shoppingListTableView: UITableView!
    let shoppingListDelegate = ShoppingListTableViewDelegate()
    let addIngredientStoryboardID = "addIngredientStoryboardID"
    let recipeListStoryboardID = "recipeListStoryboardID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FOR TESTING
//        shoppingListDelegate.addToShoppingList(Ingredient(name: "eggs", amount: 12, amountKind: amounts.Unit))
        shoppingListTableView.dataSource = shoppingListDelegate
        shoppingListTableView.delegate = shoppingListDelegate
    }
    
    override func viewWillAppear(animated: Bool) {
        shoppingListTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPopOver(sender: UIBarButtonItem) {
        let VC = storyboard!.instantiateViewControllerWithIdentifier(addIngredientStoryboardID) as! AddIngredientViewController
        VC.saveDelegate = self
    
        presentViewController(VC, animated: true, completion: nil)
    }

    func sendToPreviousVC(toSave: AnyObject) {
        shoppingListDelegate.addToShoppingList(toSave as! Ingredient)
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