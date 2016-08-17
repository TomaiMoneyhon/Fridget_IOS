//
//  ChangeServingsizePickerViewDelegate.swift
//  Fridgit
//
//  Created by Admin on 05/07/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChangeServingsizePickerViewDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 99
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return String(row+1)
    }
    
//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//        switch row {
//        case 0:
//            chosenAmountKind = amounts.Grams
//        case 1:
//            chosenAmountKind = amounts.Liters
//        case 2:
//            chosenAmountKind = amounts.Unit
//        default:
//            return
//        }
//    }

}
