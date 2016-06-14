//
//  ChosenRecipeTabBarController.swift
//  Fridgit
//
//  Created by Admin on 31/05/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChosenRecipeTabBarController: UITabBarController {
    var inFridgeList: [Ingredient]!
    var chosenRecipeID : Int!
    var chosenRecipe :AnyObject!
    var ingredients : NSArray!
    let spoonacularAPI = SpoonacularAPI()
    
    
    override func viewDidLoad() {
        
        spoonacularAPI.getChosenRecipe(chosenRecipeID) {result in
            dispatch_async(dispatch_get_main_queue()) {
                self.chosenRecipe = result
                //self.ingredients = self.chosenRecipe.valueForKey("extendedIngredients") as! NSArray
                //print(self.ingredients)
                var vcs = self.viewControllers
                var vc = vcs![0] as! ChosenRecipeIngredientsViewController
                vc.loadViewController(result)
            }
        }
    }
    
       // print(chosenRecipeURL)
    
//                    guard let url = NSURL(string: chosenRecipeURL) else {
//                        print("Error: cannot create URL")
//                        return
//                    }
//        
//                    let request = NSMutableURLRequest(URL: url)
//        
//                    ///CHANGE TO PRODUCTION KEY WHEN READY////
//                    request.addValue(API.spoonacularAPIKEYTEST, forHTTPHeaderField: "X-Mashape-Key")
//        
//                    let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
//        
//                    session.dataTaskWithRequest(request, completionHandler: { (data,response,error) in
//                        guard let response = data else {
//                            print("Error: did not receive data")
//                            return
//                        }
//                        if error != nil {
//                            print("error calling GET on /posts/1")
//                            print(error)
//                            return
//                        }
//        
//        
//                        do{
//                            var theIngredient = try NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions())
//                            self.chosenRecipe = theIngredient
//                            self.haveRecipe = true
////                            let chosenIngredientsVC = self.storyboard?.instantiateViewControllerWithIdentifier(IDs.ChosenIngredientsID) as! ChosenRecipeIngredientsViewController
////                            chosenIngredientsVC.chosenRecipeDelegate = self
//                        } catch {
//                            print("error trying to convert data to JSON")
//                            return
//                        }
//                        
//                        
//                        
//                    }).resume()
        

   // }
    func getFridgelist() -> [Ingredient]{
        return inFridgeList
    }
    
    func getChosenRecipe() -> AnyObject{
        if (chosenRecipe != nil){
            return chosenRecipe
        }
        return chosenRecipe
    }
   
}
