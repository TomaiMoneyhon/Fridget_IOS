//
//  Protocols.swift
//  Fridgit
//
//  Created by Admin on 03/04/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import Foundation
import UIKit

struct IDs {
//    static let addIngredientStoryboardID = "addIngredientStoryboardID"
    static let editIngredientStoryboardID = "editIngredientStoryboardID"
    static let NoAmountPopoverViewStoryboardID = "NoAmountPopoverViewStoryboardID"
//    static let InFridgeListStoyboardID = "InFridgeListStoyboardID"
//    static let ChosenRecipeDirectionsID = "ChosenRecipeDirectionsID"
//    static let ChosenIngredientsID = "ChosenIngredientsID"
//    static let ChangeServingSizeStoryboardID = "ChangeServingSizeStoryboardID"
    //let recipeListStoryboardID = "recipeListStoryboardID"
}

struct Identifiers {
    static let shoppingCellIdentifier = "ShoppingCustomListCell"
    static let fridgeCellIdentifier = "FridgeCustomListCell"
    static let ChosenIngredientsCustomListCell = "ChosenIngredientsCustomListCell"
    static let toRecipeListFromFridgeSegue = "toRecipeListFromFridgeSegue"
    static let toRecipeListFromShoppingSegue = "toRecipeListFromShoppingSegue"
    static let toAddIngredientSegue = "toAddIngredientSegue"
    static let toChosenRecipeFromRecipeListSegue = "toChosenRecipeFromRecipeListSegue"
    static let toChangeServingSizeSegue = "toChangeServingSizeSegue"
}

struct FileDirectories {
    static let shoppingIngredientsFILENAME = "shoppingIngredientFILENAME"
    static let fridgeIngredientsFILENAME = "fridgeIngredientFILENAME"
    static let documentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let shoppingDirectory = documentsDirectory.URLByAppendingPathComponent(shoppingIngredientsFILENAME)
    static let fridgeDirectory = documentsDirectory.URLByAppendingPathComponent(fridgeIngredientsFILENAME)
}

struct API {
    static let spoonacularAPIKEYTEST = "u2ZGgoREd8msh4ysiDyz5yJn2Gmlp1Wos17jsnAYUQMHvhAX0A"
}

struct ProtertyKey {
    static let titleKey = "title"
    static let imageKey = "image"
    static let missedIngredientsCountKey = "missedIngredientCount"
    static let extendedIngredientsKey = "extendedIngredients"
    static let idKey = "id"
    static let nameKey = "name"
    static let amountKey = "amount"
    static let amountPercentageKey = "amountPercentage"
    static let amountKindKey = "amountKind"
    static let sourceURLKey = "sourceUrl"
    static let servingSizeKey = "servings"
    static let unitShortKey = "unitShort"
}

protocol FromFridgeListProtocol: class {
    func sendtoShoppingList(toSave: Ingredient)
    func openEditPopOver(toEdit: Ingredient, atIndex: Int)
}

protocol FromShoppingListProtocol: class {
    func sendtoFridge(toSave: Ingredient)
    func openEditPopOver(toEdit: Ingredient, atIndex: Int)
    func showNoAmountAlert(toEdit: Ingredient, atIndex: Int)
}

protocol EditProtocol: class {
    func saveEdit(toSave: Ingredient, atIndex: Int)
    func deleteEdit(atIndex: Int)
}

protocol SaveNewIngredientProtocol: class {
    func saveToShoppingList(toSave: Ingredient)
}

protocol ChosenRecipeProtocol: class {
    func getChosenRecipe() -> AnyObject
}

protocol ChangeServingSizeProtocol: class {
    func changeServingSize(toServingSize: Double)
}