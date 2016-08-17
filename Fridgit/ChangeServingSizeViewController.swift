//
//  ChangeServingSizeViewController.swift
//  Fridgit
//
//  Created by Admin on 05/07/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChangeServingSizeViewController: UIViewController {
    
    @IBOutlet weak var servingSizePickerView: UIPickerView!
    let changeServingSizeDelegate = ChangeServingsizePickerViewDelegate()
    var ServingSize : Double!
    weak var servingSizeProtocol: ChangeServingSizeProtocol!
    
    override func viewDidLoad() {
        servingSizePickerView.dataSource = changeServingSizeDelegate
        servingSizePickerView.delegate = changeServingSizeDelegate
        
        servingSizePickerView.selectRow(Int(ServingSize), inComponent: 0, animated: false)
    }
    
    @IBAction func cancelBTN(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func saveBTN(sender: UIButton) {
        servingSizeProtocol.changeServingSize(Double(servingSizePickerView.selectedRowInComponent(0)))
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
