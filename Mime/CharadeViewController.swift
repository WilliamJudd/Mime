//
//  CharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/11/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit


let array = ["Frodo", "sam", "wise", "gamgee"]
let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
println(array[randomIndex])


class CharadeViewController: UIViewController {

    
    @IBOutlet weak var charadeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func charadeButton(sender: AnyObject) {
   
        
    
    }



}
