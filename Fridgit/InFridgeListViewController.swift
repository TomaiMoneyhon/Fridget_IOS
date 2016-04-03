//
//  InFridgeListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class InFridgeListViewController: UIViewController, FromFridgeListProtocol, SaveProtocol {
    
    @IBOutlet weak var inFridgeListTableView: UITableView!
    let inFridgeListViewDelegate = InFridgeListViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inFridgeListTableView.dataSource = inFridgeListViewDelegate
        inFridgeListTableView.delegate = inFridgeListViewDelegate
        inFridgeListViewDelegate.fromFridgeListProtocol = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        inFridgeListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveToFridgeList(toSend: Ingredient){
        inFridgeListViewDelegate.addToFridgeList(toSend)
    }
    
    func editIngredientInList (toSave: Ingredient, atIndex: Int){
        inFridgeListViewDelegate.addToFridgeList(toSave)
        inFridgeListViewDelegate.deletefromFridgeList(atIndex)
        
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
        VC.saveDelegate = self
        
        presentViewController(VC, animated: true, completion: nil)
    }
    
    func saveToShoppingList(toSave: Ingredient) {
        return //unessacery. only here because of saveProtocol
    }
    
    func saveEdit(toSave: Ingredient, atIndex: Int) {
        inFridgeListViewDelegate.addToFridgeList(toSave)
        inFridgeListViewDelegate.deletefromFridgeList(atIndex)
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
