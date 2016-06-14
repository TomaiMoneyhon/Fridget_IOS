//
//  ChosenRecipeIngredientsViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChosenRecipeIngredientsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var ingredientsTableView: UITableView!
    var recipeDirectionsVC : ChoosenRecipeDirectionsViewController!
    var tabBarControllerVC : ChosenRecipeTabBarController!
    weak var chosenRecipeDelegate : ChosenRecipeProtocol?
//    var chosenRecipe : AnyObject!
    var haveRecipe = false
    var ingredients = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        ingredientsTableView.hidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        
        
        tabBarControllerVC = self.tabBarController as! ChosenRecipeTabBarController
        
//        recipeDirectionsVC = storyboard?.instantiateViewControllerWithIdentifier(IDs.ChosenRecipeDirectionsID) as! ChoosenRecipeDirectionsViewController
//        recipeDirectionsVC.loadView()
//        recipeDirectionsVC.viewDidLoad()

    }
    
    func loadViewController(recievedRecipe: AnyObject) {
//        chosenRecipe = recievedRecipe
        //chosenRecipe = tabBarControllerVC.chosenRecipe
        ingredients = tabBarControllerVC.chosenRecipe.valueForKey("extendedIngredients") as! NSArray
        ///print(chosenRecipe)

        activityIndicator.stopAnimating()
        ingredientsTableView.reloadData()
        ingredientsTableView.hidden = false
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Identifiers.ChosenIngredientsCustomListCell) as? CustomListTableViewCell
        
        if (cell == nil){
            cell = CustomListTableViewCell(style: .Default, reuseIdentifier: Identifiers.ChosenIngredientsCustomListCell)
        }
        let oneIngreditent = ingredients[indexPath.row] as! NSObject
        cell!.ingredientLabel.text = oneIngreditent.valueForKey("name") as! String
        var amount = String(oneIngreditent.valueForKey("amount"))
        
//        switch(oneIngreditent.valueForKey("unitShort") as! String) {
//            
//        //teaspoon
//        case "t":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "teaspoonUK", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //tablespoon
//        case "T":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "tablespoonUK", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //cups
//        case "c":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "cupUS", "liter", Converters.ConverterKind.CookingUnits));
//            
//            break;
//        //pound
//        case "lb":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "PoundsTroy", "Grams", Converters.ConverterKind.WeightUnits));
//            
//            break;
//        //servings
//        case "servings":
//            
//            break;
//        //ounces
//        case "oz":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "OuncesTroyApoth", "Grams", Converters.ConverterKind.WeightUnits));
//            
//            break;
//        //bunch
//        case "bunch":
//            
//            break;
//        //dash
//        case "dash":
//            resultConverted = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "dash", "liter", Converters.ConverterKind.CookingUnits));
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
//        }
//        
        return cell!
    }
    
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
