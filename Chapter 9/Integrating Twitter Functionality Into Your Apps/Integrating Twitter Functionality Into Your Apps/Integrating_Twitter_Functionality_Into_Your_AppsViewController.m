//
//  Integrating_Twitter_Functionality_Into_Your_AppsViewController.m
//  Integrating Twitter Functionality Into Your Apps
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Integrating_Twitter_Functionality_Into_Your_AppsViewController.h"

@implementation 
  Integrating_Twitter_Functionality_Into_Your_AppsViewController

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.twitterController = [[TWTweetComposeViewController alloc] init];
//  [self.twitterController setInitialText:@"Your Tweet Goes Here"];
//  [self.navigationController presentModalViewController:self.twitterController
//                                               animated:YES];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.twitterController = [[TWTweetComposeViewController alloc] init];
//  
//  NSString *text = 
//  @"Anthony Robbins at Unleash the Power Within (UPW) in London";
//  
//  [self.twitterController setInitialText:text];
//  
//  UIImage *anthonyRobbins = [UIImage imageNamed:@"Anthony Robbins.jpg"];
//  [self.twitterController addImage:anthonyRobbins];
//  
//  NSURL *url = [NSURL URLWithString:@"http://www.tonyrobbins.com"];
//  [self.twitterController addURL:url];
//  
//  
//  [self.navigationController presentModalViewController:self.twitterController
//                                               animated:YES];
//  
//}

/* 3 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.twitterController = [[TWTweetComposeViewController alloc] init];
  
  __weak 
    Integrating_Twitter_Functionality_Into_Your_AppsViewController
      *weakSelf = self;
  
  [self.twitterController setCompletionHandler:
   ^(TWTweetComposeViewControllerResult result){
    
     Integrating_Twitter_Functionality_Into_Your_AppsViewController
      *strongSelf = weakSelf;
     
     switch (result){
       case TWTweetComposeViewControllerResultDone:{
         /* The Tweet was submitted successfully. 
          Will be dismissed automatically */
         break;
       }
       case TWTweetComposeViewControllerResultCancelled:{
         if (strongSelf != nil){
           [strongSelf.twitterController 
            dismissModalViewControllerAnimated:YES];
         }
         break;
       }
     }
     
  }];
  
  NSString *text = 
  @"Anthony Robbins at Unleash the Power Within (UPW) in London";
  
  [self.twitterController setInitialText:text];
  
  UIImage *anthonyRobbins = [UIImage imageNamed:@"Anthony Robbins.jpg"];
  [self.twitterController addImage:anthonyRobbins];
  
  NSURL *url = [NSURL URLWithString:@"http://www.tonyrobbins.com"];
  [self.twitterController addURL:url];
  
  
  [self.navigationController presentModalViewController:self.twitterController
                                               animated:YES];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
