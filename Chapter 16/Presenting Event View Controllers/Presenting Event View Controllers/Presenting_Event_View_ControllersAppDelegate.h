//
//  Presenting_Event_View_ControllersAppDelegate.h
//  Presenting Event View Controllers
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Presenting_Event_View_ControllersViewController;

@interface Presenting_Event_View_ControllersAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) 
  Presenting_Event_View_ControllersViewController *viewController;

@property (nonatomic, strong) UINavigationController *navigationController;

@end
