//
//  ChosenRecipeIngredientListViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 30/05/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChosenRecipeIngredientListViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate{

    var inFridgeList: [Ingredient]!
    var missingIngredients = NSMutableArray()
    var ingredients = []
    var initialServingSize: Double!
    var currentServingSize: Double?
    
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
        var amount = oneIngreditent.valueForKey(ProtertyKey.amountKey)
        let name = oneIngreditent.valueForKey(ProtertyKey.nameKey) as! String
        
        for i in 0...(inFridgeList.count-1) {
            
            if inFridgeList[i].name == name {
                cell!.backgroundColor = UIColor.greenColor()
                break
            }else {
                cell!.backgroundColor = UIColor.redColor()
                missingIngredients.addObject(oneIngreditent)
            }
        }

        
        if let cServingSize = currentServingSize{
            let oneServing = (amount as! Double)/initialServingSize
            
            amount = oneServing * cServingSize
        }
        
        cell!.ingredientLabel.text = name
        cell!.amountLabel.text = String(amount!) + " " + String(oneIngreditent.valueForKey("unit")!)
        
        return cell!
    }
    
    func addMissingIngredientsToShoppingList() {
        for i in 0...missingIngredients.count-1{
            let shoppingListTableViewDelegate = ShoppingListTableViewDelegate()
            shoppingListTableViewDelegate.loadIngredients()
            
            //let converter = ConverterAPI()
            var amount = missingIngredients[i].valueForKey(ProtertyKey.amountKey) as! Double
            let name = missingIngredients[i].valueForKey(ProtertyKey.nameKey) as! String
            var amountKind : amounts!
            //var addIngredient : Ingredient!
            
//                   switch(missingIngredients[i].valueForKey(ProtertyKey.unitShortKey) as! String) {
//            
//                    //teaspoon
//                    case "t":
//                       // cell!.amountLabel.text = converter.convert(amount, fromUnit: "teaspoonUK", toUnit: "liter", converter: Converters.CookingUnits) + " " + String(oneIngreditent.valueForKey("unit"))
//                        
//                        //let addIngredient = Ingredient(name: name, amount: converter.convert(amount, fromUnit: "teaspoonUK", toUnit: "liter", converter: Converters.CookingUnits), amountKind: amounts.Liters)
//                        
//                        amount = converter.convert(amount, fromUnit: "teaspoonUK", toUnit: "liter", converter: Converters.CookingUnits)
//                        amountKind = amounts.Liters
//            
//                        break;
//                    //tablespoon
//                    case "T":
//                        //cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "tablespoonUK", "liter", Converters.ConverterKind.CookingUnits));
//                        
//                        //let addIngredient = Ingredient(name: name, amount: converter.convert(amount, fromUnit: "tablespoonUK", toUnit: "liter", converter: Converters.CookingUnits), amountKind: amounts.Liters)
//                        
//                        amount = converter.convert(amount, fromUnit: "tablespoonUK", toUnit: "liter", converter: Converters.CookingUnits)
//                        amountKind = amounts.Liters
//            
//                        break
//                    //cups
//                    case "c":
//                        //cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "cupUS", "liter", Converters.ConverterKind.CookingUnits));
//                        
//                        //let addIngredient = Ingredient(name: name, amount: converter.convert(amount, fromUnit: "cupUS", toUnit: "liter", converter: Converters.CookingUnits), amountKind: amounts.Liters)
//                        
//                        amount = converter.convert(amount, fromUnit: "cupUS", toUnit: "liter", converter: Converters.CookingUnits)
//                        amountKind = amounts.Liters
//            
//                        break
//                    //pound
//                    case "lb":
//                       // cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "PoundsTroy", "Grams", Converters.ConverterKind.WeightUnits));
//                        
//                        amount = converter.convert(amount, fromUnit: "PoundsTroy", toUnit: "Grams", converter: Converters.WeightUnits)
//                        amountKind = amounts.Grams
//            
//                        break
//                    //servings
//                    case "servings":
//                        
//                        amountKind = amounts.Unit
//                        break
//                    //ounces
//                    case "oz":
//                        //cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "OuncesTroyApoth", "Grams", Converters.ConverterKind.WeightUnits));
//                        
//                        amount = converter.convert(amount, fromUnit: "OuncesTroyApoth", toUnit: "Grams", converter: Converters.WeightUnits)
//                        amountKind = amounts.Grams
//            
//                        break
//                    //bunch
//                    case "bunch":
//            
//                        amountKind = amounts.Unit
//                        
//                        break
//                    //dash
//                    case "dash":
//                        //cell!.amountLabel.text = Double.parseDouble(converters.cookingUnitConverter(startingAmount, "dash", "liter", Converters.ConverterKind.CookingUnits));
//                        
//                        amount = converter.convert(amount, fromUnit: "dash", toUnit: "liter", converter: Converters.CookingUnits)
//                        amountKind = amounts.Liters
//                        
//                        break
//                    //slices
//                    case "slices":
//                        
//                        break;
//                    //cloves
//                    case "cloves":
//                        
//                        break
//                    //normal units
//                    case "":
//                        
//                        break
//                    
//                   default:
//                    
//                    break
//                   }

            //let addIngredient = Ingredient(name: name, amount: amount, amountKind: amountKind)
            let addIngredient = Ingredient(name: name)
            shoppingListTableViewDelegate.addToShoppingList(addIngredient)
            
        }
    }
}
