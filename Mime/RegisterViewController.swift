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
        }
        self.register()
    // ?????????????????????????
    }
        func displayMyAlertMessage(userMessage:String){
            
            var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.presentViewController(myAlert, animated: true, completion: nil)
            
        }
        
        
        func register() {
            
            
            var user = PFUser()
            user.username = usernameTextfield.text
            user.password = passwordTextfield.text
            user.email = emailTextfield.text
            
            // other fields can be set just like with PFObject
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, error: NSError!) -> Void in
                
                if error == nil {
                    println(user)
                    self.usernameTextfield.text = ""
                    self.passwordTextfield.text = ""
                    self.emailTextfield.text = ""
                    
                    // Hooray! Let them use the app now.
                    
                } else {
                    let errorString = error.userInfo?["error"] as NSString
                    // Show the errorString somewhere and let the user try again.
                
                    var userQuery = PFUser.query()
                    
                                userQuery.whereKey("username", equalTo: self.usernameTextfield.text)
                    
                                userQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                    
                                    if objects.count > 0 {
                    
                                        self.displayMyAlertMessage("You have already registered")
                    
                                    }else{
                    
                                        self.register()
                                        
                                    }
                                    
                                    
                                })
                                // check to see if email is already used (success or failure)
                                
                                //            signUp()
                                
                            }
                            
                        }

            
                
                
                
                }
    

    


   
    



        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // ----------------------------------------------------------------------------------------------
        
        
        
//        var fieldValues: [String] = [ usernameTextfield.text,passwordTextfield.text, emailTextfield.text,repeatPassword.text]
//        
//        if find(fieldValues, "") != nil{
//            
//            //all fields are not filled in!
//            
//            var alertViewController = UIAlertController (title:"FUCK!!", message: "All fields need to be filled in.", preferredStyle: UIAlertControllerStyle.Alert)
//            
//            var defaultAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
//            
//            alertViewController.addAction(defaultAction)
//            
//            presentViewController(alertViewController, animated: true, completion: nil)
//            
//        }else{
//            
//            //all fields are filled in!
//            
//            println("all fields are good and login")
//            
//            var userQuery = PFUser.query()
//            
//            userQuery.whereKey("username", equalTo: usernameTextfield.text)
//            
//            userQuery.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
//                
//                if objects.count > 0 {
//                    
//                    self.login()
//                    
//                }else{
//                    
//                    self.register()
//                    
//                }
//                
//                
//            })
//            
//            
//            //            signUp()
//            
//        }
//        
//    }
//    
//    func login(){
//        
//        PFUser.logInWithUsernameInBackground(usernameTextfield.text, password:passwordTextfield.text) {
//            (user: PFUser!, error: NSError!) -> Void in
//            if user != nil {
//                
//                println("logged in as \(user)")
//                
//                
//                // Do stuff after successful login.
//            } else {
//                // The login failed. Check error to see why.
//            }
//        }
//}

        

//
//


    
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





