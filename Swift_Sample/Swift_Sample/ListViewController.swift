//
//  ListViewController.swift
//  Swift_Sample
//
//  Created by Raju Istalla on 18/07/16.
//  Copyright © 2016 Raju Istalla. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listTableView: UITableView!
    var itemsArray: NSMutableArray = []
    var viewHasData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewHasData = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let customCell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomCell
        
//        String str = itemsArray.objectAtIndex(indexPath.row)
//        customCell.picImageView.image = itemsArray.objectAtIndex(indexPath.row).valueForKey("imageUrl")
//        customCell.nameLabel.text = itemsArray.objectAtIndex(indexPath.row).valueForKey("firstName")
//        customCell.emailLabel.text = itemsArray.objectAtIndex(indexPath.row).valueForKey("emailId")
        
        return customCell
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

class CustomCell: UITableViewCell {
    
    // Link those IBOutlets with the UILabels in your .XIB file
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
}
