//
//  RecipeListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class RecipeListViewController: UIViewController {
    
    var inFridgeList: [Ingredient]!
    var fridgeList : String!
    var findByIngredientURL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="
    let endByIngredientURL = "&limitLicense=false&number=5&ranking=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fridgeList = String(inFridgeList[0].name)
        for i in 2...(inFridgeList.count){
            fridgeList = fridgeList + "%2C" + String(inFridgeList[i - 1].name)
        }
        findByIngredientURL = findByIngredientURL + fridgeList + endByIngredientURL
        print(findByIngredientURL)
        
        
        // Do any additional setup after loading the view.
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
