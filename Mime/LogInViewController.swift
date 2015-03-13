//
//  LogInViewController.swift
//  Mime
//
//  Created by William Judd on 2/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    @IBAction func loginButton(sender: AnyObject) {
    
        let username = usernameTextfield.text;
        let userPassword = passwordTextfield.text;
        
        if(username.isEmpty || userPassword.isEmpty)
            
        {
            
            displayMyAlertMessage("All fields are required")
            
            return
            
        }
    
        login()
   
    
    }
    
    
    
//        // ?????????????????????????
    
    
        func displayMyAlertMessage(userMessage:String){
            
            var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
  
    func login() {
        
        PFUser.logInWithUsernameInBackground(usernameTextfield.text, password:passwordTextfield.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                
                println("logged in as \(user)")
                
                
                // Do stuff after successful login.
            } else {
                // The login failed. Check error to see why.
            }
        }
    }

  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
