//
//  MenuViewController.swift
//  Mime
//
//  Created by William Judd on 3/10/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   println(PFUser.currentUser())
        
        
        
    }
   
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() == nil {
            
            var loginVC = storyboard?.instantiateViewControllerWithIdentifier("loginVC") as LogInViewController
            var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            
            appDelegate.window?.rootViewController?.presentViewController(loginVC, animated: false, completion: { () -> Void in
                
            })
            
        }
    }

    @IBAction func guessButton(sender: AnyObject) {
   
    
    
    
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
