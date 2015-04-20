//
//  CharadeMenuViewController.swift
//  Mime
//
//  Created by William Judd on 3/14/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class CharadeMenuViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func musicClicked(sender: AnyObject) {
        
        let musicCharadeArray = ["Elvis Presley","Kanye West","Prince","Michael Jackson","James Brown","Johnny Cash","John Crocker","Gucci Maine","Waka Flocka","Wiz Khalifa","Chris Brown","2 Chains","Drake","Chief Keif","Bob Marley","Snoop Dog","Lady Gaga","Madonna","Lil Wayne","Katy Perry"]
        
        
        
        //        var newVC = CharadeViewController()
        var charadeVC =  self.storyboard?.instantiateViewControllerWithIdentifier("charadeVC") as! CharadeViewController
        charadeVC.category  = musicCharadeArray
        
        
        
        self.navigationController?.pushViewController(charadeVC, animated: true)
    
    
    }
   
    
    @IBAction func moviesClicked(sender: AnyObject) {
        
        
        let movieCharadeArray = ["The Godfather","Men In Black","The Wolf Of Wallstreet","Space Jam","Fifty Shades of Grey","The Dark Knight","Lord of the Rings","Fight Club","Forrest Gump","Memento","Gladiator","Back to the Future","The Lion King","The Shining","Braveheart","Friday","Training Day","The Shawshank Redemption","Scarface","Warrior"]
        
        
        
//        var newVC = CharadeViewController()
        var charadeVC =  self.storyboard?.instantiateViewControllerWithIdentifier("charadeVC") as! CharadeViewController
        charadeVC.category  = movieCharadeArray
        
        
        self.navigationController?.pushViewController(charadeVC, animated: true)
    }
    
    
    @IBAction func sportsClicked(sender: AnyObject) {
    
      let sportCharadeArray = ["Michael Jordan","Deion Sanders","Bo Jackson","Muhammad Ali","Babe Ruth","Lebron James","Tiger Woods","Mike Tyson","Roger Federer","Jackie Robinson","Wayne Gretzky","Michael Phelps","Bruce Lee","Kobe Bryant","Usain Bolt","Cristiano Ronaldo","Tom Brady","Lance Armstrong","Manny Pacquiao","O.J. Simpson"]
        
        
        
        //        var newVC = CharadeViewController()
        var charadeVC =  self.storyboard?.instantiateViewControllerWithIdentifier("charadeVC") as! CharadeViewController
        charadeVC.category  = sportCharadeArray
        
        
        self.navigationController?.pushViewController(charadeVC, animated: true)
    
        
    
    }
    
    
    @IBAction func backButton(sender: AnyObject) {
   
    self.dismissViewControllerAnimated(true, completion: nil)
    
    
    
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
