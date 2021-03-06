//
//  RegisterViewController.swift
//  Mime
//
//  Created by William Judd on 2/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit



class RegisterViewController: UIViewController {

    
        
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    
    @IBAction func registerButton(sender: AnyObject) {

        let username = usernameTextfield.text;
        let userEmail = emailTextfield.text;
        let userPassword = passwordTextfield.text;
        let userRepeatPassword = repeatPassword.text;
        
        if(username.isEmpty || userEmail.isEmpty || userPassword.isEmpty || userRepeatPassword.isEmpty)

        {
            displayMyAlertMessage("All fields are required");
            return;
        }
        
        if(userPassword != userRepeatPassword)

        {

            displayMyAlertMessage("Passwords to not match");
            return;
            
        }else{
   
        var user = PFUser()
        user.username = usernameTextfield.text
        user.password = passwordTextfield.text
        user.email = emailTextfield.text
    
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError!) -> Void in
            
            if error == nil {
                println(user)
                self.usernameTextfield.text = ""
                self.passwordTextfield.text = ""
                self.emailTextfield.text = ""
                
                // Hooray! Let them use the app now.

                
                    self.dismissViewControllerAnimated(true, completion: nil)
                
//                var menuVC = self.storyboard?.instantiateViewControllerWithIdentifier("menuVC") as!
//                MenuViewController
//                
//                self.navigationController?.presentViewController(menuVC, animated: true, completion: nil)
                
            } else {
               
                self.displayMyAlertMessage("Please Try Again")
            }
        }
        
    }
}
    
            
    
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let recognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(recognizer)
    }
    
    func dismissKeyboard() {
        self.usernameTextfield.resignFirstResponder()
        self.passwordTextfield.resignFirstResponder()
        self.emailTextfield.resignFirstResponder()
        self.repeatPassword.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButton(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
    }


}





