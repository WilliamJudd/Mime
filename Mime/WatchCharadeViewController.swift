//
//  WatchCharadeViewController.swift
//  Mime
//
//  Created by William Judd on 3/17/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit
import MediaPlayer
import MessageUI

class WatchCharadeViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var watchCharade: UIImageView!
    
    var charrade: PFObject?
    var charadeAnswer: String?
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
                
                let rect = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height - 56.0)

                self.moviePlayer.view.frame = rect
                
                view.addSubview(self.moviePlayer.view)
                
                self.moviePlayer.play()
                
            }
            
        }
       

        // Do any additional setup after loading the view.
    }
    
    
    func guess() {
        
            var guessVC = self.storyboard?.instantiateViewControllerWithIdentifier("guessVC") as!
            GuessCharadeViewController
        println(charrade?.objectForKey("word"))
        
//            guessVC.charade = charrade?.objectForKey("word") as? PFObject
        charadeAnswer = charrade?.objectForKey("word") as? String
        
        guessVC.charadeAnswer = charadeAnswer
        
            self.navigationController?.pushViewController(guessVC, animated: true)
            
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reportButton(sender: AnyObject) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["someone@somewhere.com"])
        
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        //insert PFObject
        
        mailComposerVC.setMessageBody("charadeID:\(charrade?.objectId)", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    
    }

    @IBAction func blockButton(sender: AnyObject) {
    
    
    }

}
