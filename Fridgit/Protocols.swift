//
//  Protocols.swift
//  Fridgit
//
//  Created by Admin on 03/04/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import Foundation
import UIKit

class IDs {
    static let addIngredientStoryboardID = "addIngredientStoryboardID"
    static let editIngredientStoryboardID = "editIngredientStoryboardID"
    //let recipeListStoryboardID = "recipeListStoryboardID"
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