//
//  ShoppingListItem.swift
//  Fridgit
//
//  Created by Admin on 23/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

enum amounts : Int {
    case Grams, Liters, Unit
}

class Ingredient: NSObject, NSCoding {
    
    var name: String
    var amount: Double
    var amountPercentage: Double
    var amountKind: amounts
    
    init(name: String, amount: Double, amountKind: amounts) {
        self.name = name
        self.amount = amount
        self.amountPercentage = 1
        self.amountKind = amountKind
    }
    
    init(name: String, amount: Double, amountPercentage: Double, amountKind: amounts) {
        self.name = name
        self.amount = amount
        self.amountPercentage = amountPercentage
        self.amountKind = amountKind
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(ProtertyKey.nameKey) as! String
        let amount = aDecoder.decodeDoubleForKey(ProtertyKey.amountKey)
        let amountPercentage = aDecoder.decodeDoubleForKey(ProtertyKey.amountPercentageKey)
        let amountKind = amounts(rawValue: aDecoder.decodeIntegerForKey(ProtertyKey.amountKindKey))!
        
        self.init(name: name, amount: amount, amountPercentage: amountPercentage, amountKind: amountKind)
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: ProtertyKey.nameKey)
        aCoder.encodeDouble(amount, forKey: ProtertyKey.amountKey)
        aCoder.encodeDouble(amountPercentage, forKey: ProtertyKey.amountPercentageKey)
        
        aCoder.encodeInteger(amountKind.rawValue, forKey: ProtertyKey.amountKindKey)
    }
}
