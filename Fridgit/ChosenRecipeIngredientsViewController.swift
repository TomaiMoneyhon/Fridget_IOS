//
//  ChosenRecipeIngredientsViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChosenRecipeIngredientsViewController: UIViewController, ChangeServingSizeProtocol {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ingredientsTableView: UITableView!
//    var recipeDirectionsVC : ChoosenRecipeDirectionsViewController!
    var tabBarControllerVC : ChosenRecipeTabBarController!
    weak var chosenRecipeDelegate : ChosenRecipeProtocol?
    let chosenRecipeIngredientListViewDelegate = ChosenRecipeIngredientListViewDelegate()
//    var haveRecipe = false
//    var ingredients = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsTableView.hidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        ingredientsTableView.delegate = chosenRecipeIngredientListViewDelegate
        ingredientsTableView.dataSource = chosenRecipeIngredientListViewDelegate
        
        tabBarControllerVC = self.tabBarController as! ChosenRecipeTabBarController
    }
    
    func loadViewController(recievedRecipe: AnyObject) {
        
        chosenRecipeIngredientListViewDelegate.ingredients = tabBarControllerVC.chosenRecipe.valueForKey(ProtertyKey.extendedIngredientsKey) as! NSArray
        chosenRecipeIngredientListViewDelegate.inFridgeList = tabBarControllerVC.inFridgeList
        chosenRecipeIngredientListViewDelegate.initialServingSize = tabBarControllerVC.chosenRecipe.valueForKey(ProtertyKey.servingSizeKey) as! Double

        activityIndicator.stopAnimating()
        ingredientsTableView.reloadData()
        ingredientsTableView.hidden = false
    }
    
    func changeServingSize(toServingSize: Double) {
        chosenRecipeIngredientListViewDelegate.currentServingSize = toServingSize
        ingredientsTableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case Identifiers.toChangeServingSizeSegue:
            
            let changeServingSizeController = segue.destinationViewController as! ChangeServingSizeViewController
            print(tabBarControllerVC.chosenRecipe.valueForKey(ProtertyKey.servingSizeKey))
            
            if let cServingSize = chosenRecipeIngredientListViewDelegate.currentServingSize{
               changeServingSizeController.ServingSize = cServingSize
            }else{
                changeServingSizeController.ServingSize = tabBarControllerVC.chosenRecipe.valueForKey(ProtertyKey.servingSizeKey) as! Double
            }
            changeServingSizeController.servingSizeProtocol = self
        
        default:
            return
        }
    }
    
    @IBAction func AddMissingIngrediedntsToShoppingList(sender: UIButton) {
       chosenRecipeIngredientListViewDelegate.addMissingIngredientsToShoppingList()
    }
    
    
//        let converter = ConverterAPI()
//        
//         var numberer = converter.convert(amount, fromUnit: "teaspoonUK", toUnit: "liter", converter: Converters.CookingUnits)
//        
//        print(numberer)
        
//        switch(oneIngreditent.valueForKey("unitShort") as! String) {
//            
//        //teaspoon
//        case "t":
//            cell!.amountLabel.text = converter.convert(amount, fromUnit: "teaspoonUK", toUnit: "liter", converter: Converters.CookingUnits) + " " + String(oneIngreditent.valueForKey("unit"))
//            
//            break;
//        //tablespoon
//        case "T":
//            cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "tablespoonUK", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //cups
//        case "c":
//            cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "cupUS", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //pound
//        case "lb":
//            cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "PoundsTroy", "Grams", Converters.ConverterKind.WeightUnits));
//            
//            break;
//        //servings
//        case "servings":
//            
//            break;
//        //ounces
//        case "oz":
//            cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "OuncesTroyApoth", "Grams", Converters.ConverterKind.WeightUnits));
//            
//            break;
//        //bunch
//        case "bunch":
//            
//            break;
//        //dash
//        case "dash":
//            cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "dash", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //slices
//        case "slices":
//            
//            break;
//        //cloves
//        case "cloves":
//            
//            break;
//        //normal units
//        case "":
//            
//            break;
//       }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
