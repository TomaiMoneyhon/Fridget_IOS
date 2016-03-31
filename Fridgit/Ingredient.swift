//
//  ShoppingListItem.swift
//  Fridgit
//
//  Created by Admin on 23/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

enum amounts {
    case Grams, Liters, Unit
}

class Ingredient: NSObject {

    var name: String
    var amount: Double
    var amountPercentage: Double
    var amountKind: amounts
    var completed: Bool
    
    init(name: String, amount: Double, amountKind: amounts) {
        self.name = name
        self.amount = amount
        self.amountPercentage = 1
        self.amountKind = amountKind
        self.completed = false
    }
}
