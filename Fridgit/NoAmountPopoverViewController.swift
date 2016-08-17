//
//  NoAmountPopoverViewController.swift
//  Fridgit
//
//  Created by Admin on 19/07/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class NoAmountPopoverViewController: UIViewController {
    
    var ingredientToEdit : Ingredient!
    var itemIndex : Int!
    weak var editDelegate : EditProtocol!
    weak var fromShoppingdelegate : FromShoppingListProtocol!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountERROR: UILabel!
    @IBOutlet weak var amountPickerView: UIPickerView!
    let amountPickerViewDelegate = AmountKindPickerViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountPickerView.dataSource = amountPickerViewDelegate
        amountPickerView.delegate = amountPickerViewDelegate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveBTN(sender: UIButton) {
        
        if(amountTextField.text! == ""){
            amountTextField.borderStyle = .RoundedRect
            amountTextField.layer.borderColor = (UIColor.redColor()).CGColor
            amountERROR.text = "No amount found!"
        }
            
        else if let amountNumber = Double(amountTextField.text!) {
            
            amountTextField.borderStyle = .None
            
            amountERROR.text = ""
            
            let savedIngredient = Ingredient(name: ingredientToEdit.name, amount: amountNumber, amountKind: amountPickerViewDelegate.chosenAmountKind)
            
                editDelegate?.deleteEdit(itemIndex)
                fromShoppingdelegate.sendtoFridge(savedIngredient)
                self.dismissViewControllerAnimated(true, completion: nil)
            
        }else{
            //The amount is not a number
            amountTextField.borderStyle = .RoundedRect
            amountTextField.layer.borderColor = (UIColor.redColor()).CGColor
            amountERROR.text = "Amount must be number!"
        }
    }
    
    @IBAction func cancelBTN(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
