//
//  InFridgeListViewController.swift
//  Fridgit
//
//  Created by Admin on 22/03/2016.
//  Copyright © 2016 Tomai Moneyhon. All rights reserved.
//

import UIKit

class InFridgeListViewController: UIViewController {
    
    @IBOutlet weak var inFridgeListTableView: UITableView!
    let inFridgeListViewDelegate = InFridgeListViewDelegate()
    let recipeListStoryboardID = "recipeListStoryboardID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inFridgeListTableView.dataSource = inFridgeListViewDelegate
        inFridgeListTableView.delegate = inFridgeListViewDelegate
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        inFridgeListTableView.reloadData()
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
