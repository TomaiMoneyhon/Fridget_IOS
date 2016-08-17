//
//  ChoosenRecipeDirectionsViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class ChoosenRecipeDirectionsViewController: UIViewController {

    var tabBarControllerVC : ChosenRecipeTabBarController!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarControllerVC = self.tabBarController as! ChosenRecipeTabBarController
        
        var directionsURL = NSURL(string: String(tabBarControllerVC.chosenRecipe.valueForKey(ProtertyKey.sourceURLKey)!))
        
        let request = NSURLRequest(URL: directionsURL!)
        webView.loadRequest(request)
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
