//
//  AddIngredientViewController.swift
//  Fridgit
//
//  Created by Admin on 27/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController {
    
    @IBOutlet weak var ingredientNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountERROR: UILabel!
    @IBOutlet weak var ingredientNameERROR: UILabel!
    @IBOutlet weak var amountKindPicker: UIPickerView!
    let amountKindPickerViewDelegate = AmountKindPickerViewDelegate()
    weak var saveDelegate : SaveProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountKindPicker.dataSource = amountKindPickerViewDelegate
        amountKindPicker.delegate = amountKindPickerViewDelegate
    }

    @IBAction func cancel(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save(sender: UIButton) {

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
            
            saveDelegate?.saveToShoppingList(savedIngredient)
            self.dismissViewControllerAnimated(true, completion: nil)
        }else{
            //The amount is not a number
            amountTextField.borderStyle = .RoundedRect
            amountTextField.layer.borderColor = (UIColor.redColor()).CGColor
            amountERROR.text = "Amount must be number!"
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


