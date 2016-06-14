//
//  AmountKindPickerViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 07/04/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class AmountKindPickerViewDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{

    var chosenAmountKind = amounts.Grams
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var amountKindArray = [String]()
        
        amountKindArray.append(String(amounts.Grams))
        amountKindArray.append(String(amounts.Liters))
        amountKindArray.append(String(amounts.Unit))
        
        return amountKindArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            chosenAmountKind = amounts.Grams
        case 1:
            chosenAmountKind = amounts.Liters
        case 2:
            chosenAmountKind = amounts.Unit
        default:
            return
        }
    }
    
    
}
