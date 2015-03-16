//
//  HomeTableViewController.swift
//  Mime
//
//  Created by William Judd on 3/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
        
//        var tableView: UITableView?
        var messages: NSArray?
        
        override func viewDidLoad() {
            super.viewDidLoad()
           
            
            
            messages = []
            
            let logoutButton = UIBarButtonItem(title: "Log Out", style: UIBarButtonItemStyle.Plain, target: self, action: "signOut")
            navigationItem.rightBarButtonItem = logoutButton
            
            tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
            tableView?.delegate = self
            tableView?.dataSource = self
            view.addSubview(tableView!)
            
            
        }
        
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            let query = PFQuery(className: "Messages")
            query.whereKey("recipientIds", equalTo: PFUser.currentUser().objectId)
            query.orderByDescending("createdAt")
            query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    self.messages = objects
                    self.tableView?.reloadData()
                } else {
                    println(error)
                }
            }
        }
        
        func signOut() {
            PFUser.logOut()
//            view.window?.rootViewController = LoginViewController()
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return messages!.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cellId: NSString = "cell"
            var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
            }
            let message = messages![indexPath.row] as PFObject
            cell?.textLabel?.text = message["senderName"] as NSString
            let fileType = message["fileType"] as NSString
            cell?.imageView?.image = UIImage(named: fileType == "image" ? "icon_image" : "icon_video")
            return cell!
        }
    }

    
    
    
    
    
    
    /////////////////////////////////////
    /*
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() == nil{
            
            var loginNC = storyboard?.instantiateViewControllerWithIdentifier("loginNC") as UINavigationController
            
            presentViewController(loginNC, animated: false, completion: nil)
        }
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.

    }
*/
*/


//}


