//
//  CharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/11/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit




class CharadeViewController: UIViewController {

    let charadeArray = ["Jimbo", "jackie", "jenn", "bob"]
    
    var chArray = NSArray()
    
    
    @IBOutlet weak var charadeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func againButton(sender: AnyObject) {
   
    
    }


    
    @IBAction func playButton(sender: AnyObject) {
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
   
    dismissViewControllerAnimated(true, completion: nil)
    
        
    
    }
}
