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
    static let addIngredientStoryboardID = "addIngredientStoryboardID"
    static let editIngredientStoryboardID = "editIngredientStoryboardID"
    //let recipeListStoryboardID = "recipeListStoryboardID"
}

struct Identifiers {
    static let shoppingCellIdentifier = "ShoppingCustomListCell"
    static let fridgeCellIdentifier = "FridgeCustomListCell"
}

struct FileDirectories {
    static let shoppingIngredientsFILENAME = "shoppingIngredientFILENAME"
    static let fridgeIngredientsFILENAME = "fridgeIngredientFILENAME"
    static let documentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let shoppingDirectory = documentsDirectory.URLByAppendingPathComponent(shoppingIngredientsFILENAME)
    static let fridgeDirectory = documentsDirectory.URLByAppendingPathComponent(fridgeIngredientsFILENAME)
}

struct ProtertyKey {
    static let nameKey = "name"
    static let amountKey = "amount"
    static let amountPercentageKey = "amountPercentage"
    static let amountKindKey = "amountKind"
}

protocol FromFridgeListProtocol: class {
    func sendtoShoppingList(toSave: Ingredient)
    func openEditPopOver(toEdit: Ingredient, atIndex: Int)
}

protocol FromShoppingListProtocol: class {
    func sendtoFridge(toSave: Ingredient)
    func openEditPopOver(toEdit: Ingredient, atIndex: Int)
}

protocol SaveProtocol: class {
    func saveToShoppingList(toSave: Ingredient)
    func saveEdit(toSave: Ingredient, atIndex: Int)
}