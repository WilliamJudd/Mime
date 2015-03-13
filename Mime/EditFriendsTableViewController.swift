//
//  EditFriendsTableViewController.swift
//  Mime
//
//  Created by William Judd on 3/10/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class EditFriendsTableViewController: UITableViewController {
 
    var friends: Array<AnyObject>?
    var allUsers: Array<AnyObject>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Friends"
        allUsers = []
        
//        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
//        tableView?.delegate = self
//        tableView?.dataSource = self
//        view.addSubview(tableView!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var query = PFUser.query()
        query.orderByAscending("username")
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                self.allUsers = objects
                self.tableView?.reloadData()
            } else {
                println(error.localizedDescription)
            }
        }
    }
    
    func isFriend(user: PFUser) -> Bool {
        return (friends! as Array<PFUser>).filter({ (friend: PFUser) -> Bool in friend.objectId == user.objectId}).count > 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUsers!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId: NSString = "cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        let user = allUsers![indexPath.row] as PFUser
        cell?.textLabel?.text = user.username
        cell?.accessoryType = isFriend(user) ? .Checkmark : .None
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let user = allUsers![indexPath.row] as PFUser
        var friendsRelation = PFUser.currentUser().relationForKey("friendsRelation")
        
        if isFriend(user) {
            cell?.accessoryType = UITableViewCellAccessoryType.None
            for (var i=0; i<friends!.count; i++) {
                if user.objectId == friends![i].objectId {
                    friends?.removeAtIndex(i)
                    break
                }
            }
            friendsRelation.removeObject(user)
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            friends?.append(user)
            friendsRelation.addObject(user)
        }
        
        PFUser.currentUser().saveInBackgroundWithBlock { (success: Bool, error: NSError!) -> Void in
            if error != nil {
                println(error.localizedDescription)
            }
        }
    }
}

/*
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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

}*/
