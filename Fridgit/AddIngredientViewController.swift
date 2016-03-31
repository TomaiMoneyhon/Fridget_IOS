//
//  AddIngredientViewController.swift
//  Fridgit
//
//  Created by Admin on 27/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var ingredientNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountERROR: UILabel!
    @IBOutlet weak var ingredientNameERROR: UILabel!
    @IBOutlet weak var amountKindPicker: UIPickerView!
    var chosenAmountKind = amounts.Grams
    weak var saveDelegate : SaveProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountKindPicker.dataSource = self
        amountKindPicker.delegate = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3 //the number of amount kinds in enum
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

    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save(sender: UIButton) {
//        let chosenName = ingredientNameTextField.text!
//        let chosenAmount = Double(amountTextField.text!)
        if (ingredientNameTextField.text! == "" || amountTextField.text! == ""){
            
            ingredientNameTextField.borderStyle = .None
            amountTextField.borderStyle = .None
            ingredientNameERROR.text = ""
            amountERROR.text = ""
            if(ingredientNameTextField.text! == ""){
                ingredientNameTextField.borderStyle = .RoundedRect
                ingredientNameTextField.layer.borderColor = (UIColor.redColor()).CGColor
                 ingredientNameERROR.text = "Please type a ingredient!"
            }
            if(amountTextField.text! == ""){
                amountTextField.borderStyle = .RoundedRect
                amountTextField.layer.borderColor = (UIColor.redColor()).CGColor
                amountERROR.text = "No amount found!"
            }
        }
        else if let amountNumber = Double(amountTextField.text!) {
            
            ingredientNameTextField.borderStyle = .None
            amountTextField.borderStyle = .None
            ingredientNameERROR.text = ""
            amountERROR.text = ""
            
             let savedIngredient = Ingredient(name: ingredientNameTextField.text!, amount: amountNumber, amountKind: chosenAmountKind)
            
            saveDelegate?.sendToPreviousVC(savedIngredient)
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            //The amount is not a number
        }
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

protocol SaveProtocol: class {
    func sendToPreviousVC(toSave: AnyObject)
}


