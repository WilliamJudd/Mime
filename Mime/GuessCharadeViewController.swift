//
//  GuessCharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class GuessCharadeViewController: UIViewController {

    let randomCharadeArray = ["Elvis Presley","Kanye West","Prince","Michael Jackson","James Brown","Johnny Cash","John Crocker","Gucci Maine","Waka Flocka","Wiz Khalifa","Chris Brown","2 Chains","Drake","Chief Keif","Bob Marley","Snoop Dog","Lady Gaga","Madonna","Lil Wayne","Katy Perry","The Godfather","Men In Black","The Wolf Of Wallstreet","Space Jam","Fifty Shades of Grey","The Dark Knight","Lord of the Rings","Fight Club","Forrest Gump","Memento","Gladiator","Back to the Future","The Lion King","The Shining","Braveheart","Friday","Training Day","The Shawshank Redemption","Scarface","Warrior","Michael Jordan","Deion Sanders","Bo Jackson","Muhammad Ali","Babe Ruth","Lebron James","Tiger Woods","Mike Tyson","Roger Federer","Jackie Robinson","Wayne Gretzky","Michael Phelps","Bruce Lee","Kobe Bryant","Usain Bolt","Cristiano Ronaldo","Tom Brady","Lance Armstrong","Manny Pacquiao","O.J. Simpson"]
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // right answer + 3 random answers
    var answerArray = ["Elvis Presley","Kanye West","Prince","Michael Jackson"];
    
    // index of right answer in array
    var correct = 2
    
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
    
    override func viewDidAppear(animated: Bool) {
        
        buttonA.setTitle(answerArray[0], forState: .Normal)
        buttonB.setTitle(answerArray[1], forState: .Normal)
        buttonC.setTitle(answerArray[2], forState: .Normal)
        buttonD.setTitle(answerArray[3], forState: .Normal)
        
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
    
        if correct == 0 {
            
            // win
            
        } else {
            
            // wrong
            
        }
        
    }

    
    @IBAction func buttonBClicked(sender: AnyObject) {
        
        if correct == 1 {
            
            // win
            
        } else {
            
            // wrong
            
        }
    }
    
    
    @IBAction func buttonCClicked(sender: AnyObject) {
    
    }
    
    
    @IBAction func buttonDClicked(sender: AnyObject) {
    
    }

}
