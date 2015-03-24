//
//  WatchCharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/17/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit
import MediaPlayer

class WatchCharadeViewController: UIViewController {
    
    
    @IBOutlet weak var watchCharade: UIImageView!
    
    var charrade: PFObject?
    var moviePlayer : MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let guess = UIBarButtonItem(title: "Guess", style: UIBarButtonItemStyle.Plain, target: self, action: "guess")
        navigationItem.setRightBarButtonItem(guess, animated: true)
       
        
        if var charadeImage = charrade?.objectForKey("imageFile") as? PFFile {
            
            
            charadeImage.getDataInBackgroundWithBlock { (imageData: NSData!, error: NSError!) -> Void in
                
                self.watchCharade.image = UIImage(data: imageData)
                
            }
            
        }
        
        
        if var charadeVideo = charrade?.objectForKey("videoFile") as? PFFile {
            
            
            if let videoURL = NSURL(string: charadeVideo.url) {
                
                self.moviePlayer = MPMoviePlayerController(contentURL: videoURL)

                self.moviePlayer.view.frame = view.frame
                
                view.addSubview(self.moviePlayer.view)
                
                self.moviePlayer.play()
                
            }
            
        }
       

        // Do any additional setup after loading the view.
    }
    
    
    func guess() {
        
            var guessVC = self.storyboard?.instantiateViewControllerWithIdentifier("guessVC") as
            GuessCharadeViewController
            
            self.navigationController?.pushViewController(guessVC, animated: true)
            
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
