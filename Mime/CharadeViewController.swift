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
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let index = arc4random_uniform(UInt32(charadeArray.count))
        let word = charadeArray[index - 1]
        charadeLabel.text = word
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func againButton(sender: AnyObject) {
        
        let index = arc4random_uniform(UInt32(charadeArray.count))
        let word2 = charadeArray[index - 1]
        charadeLabel.text = word2
    
    }


    
    @IBAction func playButton(sender: AnyObject) {
    
    
    
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
   
    dismissViewControllerAnimated(true, completion: nil)
    
        
    
    }
}
