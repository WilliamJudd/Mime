//
//  FriendsViewController.swift
//  Mime
//
//  Created by William Judd on 3/10/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

   
    @IBAction func backButton(sender: AnyObject) {
   
    self.dismissViewControllerAnimated(true, completion: nil)
    
    
    }
    
    @IBAction func logoutButton(sender: AnyObject) {
   
        PFUser.logOut()
  self.presentViewController(LogInViewController(), animated: true, completion: nil)
        
        
        
//        self.loginSetup()
//        self.performSegueWithIdentifier("logout", sender: self)
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginSetup() {
        
        if (PFUser.currentUser() == nil) {
            
            var logInViewController = LogInViewController()
            
         
            
            var signUpViewController = RegisterViewController()
            
            
            
            self.presentViewController(logInViewController, animated: true, completion: nil)
            
            
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
    
}
