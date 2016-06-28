//
//  SpoonacularAPI.swift
//  Fridgit
//
//  Created by Admin on 06/06/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class SpoonacularAPI: NSObject {
    
    let spoonacularAPIKEYTEST = "u2ZGgoREd8msh4ysiDyz5yJn2Gmlp1Wos17jsnAYUQMHvhAX0A"
    static let numberOfRecipes = 50
    static var recipeListResults : NSArray!
    
     static func getResultFromURL(urlString: String, completion: ((result: AnyObject) ->Void)){
        
        var URLResult : AnyObject!
        
        guard let url = NSURL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        let request = NSMutableURLRequest(URL: url)
        
        
        ///CHANGE TO PRODUCTION KEY WHEN READY////
        request.addValue(API.spoonacularAPIKEYTEST, forHTTPHeaderField: "X-Mashape-Key")
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        session.dataTaskWithRequest(request, completionHandler: { (data,response,error) in
            guard let response = data else {
                print("Error: did not receive data")
                return
            }
            if error != nil {
                print("error calling GET on /posts/1")
                print(error)
                return
            }
            do{
                URLResult = try NSJSONSerialization.JSONObjectWithData(response, options: NSJSONReadingOptions())
            } catch {
                print("error trying to convert data to JSON")
                return
            }
            completion(result: URLResult)
        }).resume()
    }

    
    static func getRecipesByIngredients(ingredients: [Ingredient], completion: ((result: NSArray) -> Void)) {
        
        var findByIngredientURL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients="
        
        var fridgeList = String(ingredients[0].name)
        
        if ingredients.count > 1 {
            for i in 2...(ingredients.count){
                fridgeList = fridgeList + "%2C+" + String(ingredients[i - 1].name)
            }
        }
        
        let endByIngredientURL = "&limitLicense=false&number=" + String(numberOfRecipes) + "&ranking=2"
        findByIngredientURL = findByIngredientURL + fridgeList + endByIngredientURL
        
        getResultFromURL(findByIngredientURL)
            {result in
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: result as! NSArray)
                }
            }
    }
    
    
    static func getChosenRecipe(recipeID: Int, completion: ((result: AnyObject) ->Void)) {
        
        let chosenRecipeURL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + String(recipeID) + "/information?includeNutrition=false"
        
        getResultFromURL(chosenRecipeURL)
            {result in dispatch_async(dispatch_get_main_queue()) {
                completion(result: result)
            }
        }
    }
//TODO Not done
//    static func getRecipeImageURL() -> NSURL {
//        let ImageURl
//    }
}



    
        
    
        
        