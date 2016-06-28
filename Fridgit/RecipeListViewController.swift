//
//  RecipeListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit
import Foundation

class RecipeListViewController: UIViewController {
    
    @IBOutlet weak var recipeMissingItems: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var inFridgeList: [Ingredient]!
    var results : NSArray!
    var currentRecipe : Int!
//    let spoonacularAPI = SpoonacularAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true

        SpoonacularAPI.getRecipesByIngredients(inFridgeList) {result in dispatch_async(dispatch_get_main_queue()) {
                self.results = result
                self.setCurrentRecipe(0)
            }
        }
    }
    
    func setCurrentRecipe(toRecipe: Int) {
        let imageURL = NSURL(string: (self.results[toRecipe].valueForKey("image") as? String)!)
        currentRecipe = toRecipe
        activityIndicator.startAnimating()
        
        NSURLSession.sharedSession().dataTaskWithURL(imageURL!) { (data, response, error) in
            dispatch_async(dispatch_get_main_queue()) {() -> Void in
                guard let data = data where error == nil else {return}
                self.recipeImageView.image = UIImage(data: data)
                self.recipeName.text = self.results[toRecipe].valueForKey("title") as? String
                self.recipeMissingItems.text = String(self.results[toRecipe].valueForKey("missedIngredientCount") as! Int)
                self.activityIndicator.stopAnimating()
                
            }
            }.resume()
        
    }

    @IBAction func nextRecipe(sender: UIButton) {
        if SpoonacularAPI.numberOfRecipes-1 == currentRecipe {
            setCurrentRecipe(0)
        }else{
        setCurrentRecipe(currentRecipe + 1)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier! == Identifiers.toChosenRecipeFromRecipeListSegue {
            
            let chosenRecipeIngredientsViewController = segue.destinationViewController as! ChosenRecipeTabBarController
            
            chosenRecipeIngredientsViewController.inFridgeList = self.inFridgeList
            
            let ID = self.results[currentRecipe].valueForKey("id") as! Int
            
            chosenRecipeIngredientsViewController.chosenRecipeID = ID
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
