//
//  Integrating_Twitter_Functionality_Into_Your_AppsAppDelegate.h
//  Integrating Twitter Functionality Into Your Apps
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Integrating_Twitter_Functionality_Into_Your_AppsViewController;

@interface Integrating_Twitter_Functionality_Into_Your_AppsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Integrating_Twitter_Functionality_Into_Your_AppsViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
