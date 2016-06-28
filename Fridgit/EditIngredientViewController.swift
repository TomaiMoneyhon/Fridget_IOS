//
//  EditIngredientViewController.swift
//  Fridgit
//
//  Created by Admin on 03/04/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class EditIngredientViewController: UIViewController {


    var ingredientToEdit : Ingredient!
    var itemIndex : Int!
    weak var editDelegate : EditProtocol!
    let amountKindPickerViewDelegate = AmountKindPickerViewDelegate()
    @IBOutlet weak var ingredientNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountKindPicker: UIPickerView!
    @IBOutlet weak var ingredientNameERROR: UILabel!
    @IBOutlet weak var amountERROR: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientNameTextField.text = ingredientToEdit.name
        amountTextField.text = String(ingredientToEdit.amount)

        amountKindPicker.dataSource = amountKindPickerViewDelegate
        amountKindPicker.delegate = amountKindPickerViewDelegate
        
        switch ingredientToEdit.amountKind {
        case .Grams:
            amountKindPicker.selectRow(0, inComponent: 0, animated: false)
        case .Liters:
            amountKindPicker.selectRow(1, inComponent: 0, animated: false)
        case .Unit:
            amountKindPicker.selectRow(2, inComponent: 0, animated: false)
        }
    }
    
    @IBAction func saveEdit(sender: UIButton) {
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
            
            let savedIngredient = Ingredient(name: ingredientNameTextField.text!, amount: amountNumber, amountKind: amountKindPickerViewDelegate.chosenAmountKind)
            
            if(ingredientToEdit == savedIngredient){
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else{
                editDelegate?.saveEdit(savedIngredient, atIndex: itemIndex)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }else{
            //The amount is not a number
            amountTextField.borderStyle = .RoundedRect
            amountTextField.layer.borderColor = (UIColor.redColor()).CGColor
            amountERROR.text = "Amount must be number!"
        }
    }
    
    @IBAction func deleteIngredient(sender: UIButton) {
        editDelegate?.deleteEdit(itemIndex)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    @IBAction func cancelEdit(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
