//
//  Data.swift
//  Mime
//
//  Created by William Judd on 3/17/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit
//
//let _mainData: FeedData = FeedData()
//
//class FeedData: NSObject {
//    
//    var selectedCharade: PFFile
//    
//    var feedItems: [PFObject] = []
//    //    var myFeedItems: [PFObject] = []
//    
//    class func mainData() -> FeedData {
//        
//        return _mainData
//        
//    }
//    
//    func refreshFeedItems(completion: () -> ()) {
//        
//        var feedQuery = PFQuery(className: "Charade")
//        
//        feedQuery.includeKey("sender")
//        
//        
//        feedQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            
//            if objects.count > 0 {
//                
//                self.feedItems = objects as [PFObject]
//                
//            }
//            
//            completion()
//            
//        }
//        
//}
//
//
////func refreshMyFeedItems(completion: () -> ()) {
////    
////    var feedQuery = PFQuery(className: "Charade")
////    
////    feedQuery.whereKey("creator", equalTo: PFUser.currentUser())
////    
////    feedQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
////        
////        //            if objects.count > 0 {
////        
////        self.feedItems = objects as [PFObject]
////        
////        //            }
////        
////        completion()
////        
////    }
////    
////}




