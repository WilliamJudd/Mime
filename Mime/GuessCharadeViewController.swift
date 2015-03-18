//
//  GuessCharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class GuessCharadeViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!

    @IBOutlet weak var resultLabel: UILabel!

    var questionNumber: UInt32!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func randomQuestion(){
//        
////        var randomNumber = arc4random_uniform() % 4
//        randomNumber += 1
//        
//        switch(randomNumber){
//            
//        case 1:
//            
//            questionLabel.text = "What is the Charade"
//            buttonA.setTitle("Charade 1", forState: UIControlState.normal)
//            
//            break
//        case 2:
//            
//            break
//            
//        case 3:
//            
//            break
//            
//        case 4:
//            
//            break
//            
//        default:
//            
//            break
//            
//            
//        }
//        
//    }
  
    @IBAction func buttonAClicked(sender: AnyObject) {
    
    }

    
    @IBAction func buttonBClicked(sender: AnyObject) {
    
    }
    
    
    @IBAction func buttonCClicked(sender: AnyObject) {
    
    }
    
    
    @IBAction func buttonDClicked(sender: AnyObject) {
    
    }

}
