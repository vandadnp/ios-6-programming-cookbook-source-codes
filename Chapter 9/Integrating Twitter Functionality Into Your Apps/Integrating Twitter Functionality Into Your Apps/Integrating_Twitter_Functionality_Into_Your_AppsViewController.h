//
//  Integrating_Twitter_Functionality_Into_Your_AppsViewController.h
//  Integrating Twitter Functionality Into Your Apps
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//#import <Twitter/Twitter.h>
//
//@interface Integrating_Twitter_Functionality_Into_Your_AppsViewController
//           : UIViewController
//
//@end

/* 2 */
#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>

@interface Integrating_Twitter_Functionality_Into_Your_AppsViewController
           : UIViewController

@property (nonatomic, strong) TWTweetComposeViewController *twitterController;

@end
