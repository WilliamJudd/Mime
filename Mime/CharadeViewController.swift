//
//  CharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/11/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit




class CharadeViewController: UIViewController {
    
    var category: [String]?
    
//    init(makeWithCategory:Int){
//        
//        self.category = makeWithCategory
//    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    let randomCharadeArray = ["Elvis Presley","Kanye West","Prince","Michael Jackson","James Brown","Johnny Cash","John Crocker","Gucci Maine","Waka Flocka","Wiz Khalifa","Chris Brown","2 Chains","Drake","Chief Keif","Bob Marley","Snoop Dog","Lady Gaga","Madonna","Lil Wayne","Katy Perry","The Godfather","Men In Black","The Wolf Of Wallstreet","Space Jam","Fifty Shades of Grey","The Dark Knight","Lord of the Rings","Fight Club","Forrest Gump","Memento","Gladiator","Back to the Future","The Lion King","The Shining","Braveheart","Friday","Training Day","The Shawshank Redemption","Scarface","Warrior","Michael Jordan","Deion Sanders","Bo Jackson","Muhammad Ali","Babe Ruth","Lebron James","Tiger Woods","Mike Tyson","Roger Federer","Jackie Robinson","Wayne Gretzky","Michael Phelps","Bruce Lee","Kobe Bryant","Usain Bolt","Cristiano Ronaldo","Tom Brady","Lance Armstrong","Manny Pacquiao","O.J. Simpson"]
    
    
    
    var chArray = NSArray()
    
    
    @IBOutlet weak var charadeLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        againButton(nil)
//        let index = arc4random_uniform(UInt32(randomCharadeArray.count))
//        let word = randomCharadeArray[index - 1]
//        
//                var newString = self.category?[Int(index)]
//        charadeLabel.text = newString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func againButton(sender: AnyObject?) {
        
        if let category = category {
            
            
            let index = Int(arc4random_uniform(UInt32(category.count)))
            let word = category[index]
            charadeLabel.text = word
            
            // switch on category and use different arrays

//            switch category {
//               
//            case (String[musicCharadeArray]):
//                
//            }
//            
            
        } else {
            
            let index = Int(arc4random_uniform(UInt32(randomCharadeArray.count)))
            let word = randomCharadeArray[index]
            charadeLabel.text = word
            
        }

        
    }


    
    @IBAction func playButton(sender: AnyObject) {
    
        var cameraTVC = self.storyboard?.instantiateViewControllerWithIdentifier("cameraTVC") as
        CameraTableViewController
        
        cameraTVC.correctCharade = charadeLabel.text
        
        let navController = UINavigationController(rootViewController: cameraTVC)
        
        
        presentViewController(navController, animated: true, completion: nil)
    
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
   
    dismissViewControllerAnimated(true, completion: nil)
    
        
    
    }
}
