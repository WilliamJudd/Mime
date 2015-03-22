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
        
        println("the charrade: \(charrade)")
        
        
        
        
            var charadeImage = charrade?.objectForKey("file") as PFFile
            charadeImage.getDataInBackgroundWithBlock { (imageData: NSData!, error: NSError!) -> Void in
                self.watchCharade.image = UIImage(data: imageData)
                
        }
//
//            
//           }
        
//        var url:NSURL = NSURL(string: "http://files.parsetfss.com/34a0e308-5429-415b-8efe-d0133bc74917/tfss-8b999dbf-b36a-43d4-a570-d2f83b683607-Vid_20150318_103633.mp4")!
//        
//        moviePlayer = MPMoviePlayerController(contentURL: url)
//        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
//        
//        self.view.addSubview(moviePlayer.view)
//        moviePlayer.fullscreen = true
//        
//        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        
        
//        watchCharade.image = UIImage["file"] as PFFile
        
        watchCharade.contentMode = UIViewContentMode.ScaleAspectFit

//        seatNameLabel.text = FeedData.mainData().selectedSeat?["name"] as? String
        
//        let userImageFile = ["Charades"] as PFFile
//        
//        userImageFile.getDataInBackgroundWithBlock {
//            (imageData: NSData!, error: NSError!) -> Void in
//            
//            if error == nil {
//                
//                let image = UIImage(data:imageData)
//                self.seatImageView.image = image
//                
//            }
//            
//        }

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
