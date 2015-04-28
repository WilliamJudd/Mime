//
//  HomeTableViewController.swift
//  Mime
//
//  Created by William Judd on 3/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
        
        var charades: NSArray?
        var selectedMessage: PFObject?
    
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            
            
            charades = []
            
//            let backbutt = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
//            navigationItem.leftBarButtonItem = backbutt
            
            let query = PFQuery(className: "Charades")
            query.whereKey("recipientIds", equalTo: PFUser.currentUser().objectId)
            query.orderByDescending("createdAt")
            query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
                
                if error == nil {
                    self.charades = objects
                    self.tableView?.reloadData()
                    
//                    println("printing: \(self.charades)")
                    
                    
                } else {
                    println(error)
                }
            }
            
//            func back() {
//                
//                
//                self.dismissViewControllerAnimated(false, completion: nil)
//    
//            }
    }
        
       
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return charades!.count
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            
            let cellId: NSString = "cell"
            
            var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId as String) as? UITableViewCell
            
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId as String)
            }
            
            
            let message = charades![indexPath.row] as! PFObject
            
            cell?.textLabel?.text = message["senderName"] as! NSString as String
            
            let fileType = message["fileType"] as! NSString
            
            cell?.imageView?.image = UIImage(named: fileType == "image" ? "icon_image" : "icon_video")
            return cell!
        }
    
    
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            
            var watchVC = self.storyboard?.instantiateViewControllerWithIdentifier("watchVC") as! WatchCharadeViewController
    
            
            watchVC.charrade = self.charades?.objectAtIndex(indexPath.row) as! PFObject?
            
            self.navigationController?.pushViewController(watchVC, animated:true)
        
    
    }
    @IBAction func backButton(sender: AnyObject) {
   
        self.dismissViewControllerAnimated(true, completion: nil)

    
    }
    }








