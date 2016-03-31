//
//  ShoppingListCellTableViewCell.swift
//  Fridgit
//
//  Created by Admin on 23/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class CustomListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
