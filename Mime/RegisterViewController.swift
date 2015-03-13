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
            displayMyAlertMessage("All fields are required")
            return
        }
        if(userPassword != userRepeatPassword)

        {

        displayMyAlertMessage("Passwords to not match")
        return
   
        }else{
   
        var user = PFUser()
        user.username = usernameTextfield.text
        user.password = passwordTextfield.text
        user.email = emailTextfield.text
    
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            
            if error == nil {
                println(user)
                self.usernameTextfield.text = ""
                self.passwordTextfield.text = ""
                self.emailTextfield.text = ""
                
                // Hooray! Let them use the app now.
                
            } else {

                var menuVC = self.storyboard?.instantiateViewControllerWithIdentifier("menuVC") as
                MenuViewController
                
               self.navigationController?.pushViewController(menuVC, animated: true)
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





