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
//    var charade: PFObject!
    var charadeAnswer: String?
    
    // right answer + 3 random answers
        
    
    // index of right answer in array
    var correctButton: UIButton?
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!

    @IBOutlet weak var resultLabel: UILabel!

    var questionNumber: UInt32!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let randomIndex = Int(arc4random_uniform(UInt32(randomCharadeArray.count - 3)))
        
        let randomButtonIndex = Int(arc4random_uniform(UInt32(3)))
        
        var answerArray = [randomCharadeArray[randomIndex],randomCharadeArray[randomIndex + 1], randomCharadeArray[randomIndex + 2]]
        var finalAnswerArray = NSMutableArray()
        for i in 0...3 {
            if i == randomButtonIndex {
                finalAnswerArray[i] = charadeAnswer!
            } else {
                finalAnswerArray[i] = answerArray.last!
                answerArray.removeLast()
            }
        }
        
        setupCorrectButton(randomButtonIndex)
        
        // then set button titles from array

        
        // Do any additional setup after loading the view.
    
        buttonA.setTitle(finalAnswerArray[0] as NSString, forState: .Normal)
        buttonB.setTitle(finalAnswerArray[1] as NSString, forState: .Normal)
        buttonC.setTitle(finalAnswerArray[2] as NSString, forState: .Normal)
        buttonD.setTitle(finalAnswerArray[3] as NSString, forState: .Normal)

    }
    
    func setupCorrectButton(index: Int) {
        switch (index) {
        case (0):
            correctButton = buttonA
        case (1):
            correctButton = buttonB
        case (2):
            correctButton = buttonC
        case (3):
            correctButton = buttonD
        default:
            correctButton = buttonA
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

  
    @IBAction func buttonClicked(sender: AnyObject) {
    
        if sender.isEqual(correctButton) {
            
            // win
            
        } else {
            
            // wrong
            
        }
        
    }

}
