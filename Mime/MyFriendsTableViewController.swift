//
//  MyFriendsTableViewController.swift
//  Mime
//
//  Created by William Judd on 3/10/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit


class MyFriendsTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var friendsRelation: PFRelation?
    var friends: Array<AnyObject>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = []
        
        let editButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: "edit")
        navigationItem.rightBarButtonItem = editButton
        
        
//        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain)
//        tableView?.delegate = self
//        tableView?.dataSource = self
//        view.addSubview(tableView!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        friendsRelation = PFUser.currentUser().relationForKey("friendsRelation")
        var query = friendsRelation?.query()
        query?.orderByAscending("username")
        query?.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                self.friends = objects
                self.tableView?.reloadData()
            } else {
                println(error.localizedDescription)
            }
        })
    }
    
  

    
    func edit() {
        var editVC = EditFriendsTableViewController()
        editVC.friends = friends
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId: NSString = "cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId as String) as? UITableViewCell
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId as String)
        }
        let user = friends![indexPath.row] as! PFUser
        cell?.textLabel?.text = user.username
        return cell!
    }
}




