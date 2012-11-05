//
//  Implementing_Navigation_with_UINavigationControllerAppDelegate.h
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Implementing_Navigation_with_UINavigationControllerAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) RootViewController *rootViewController;

@end
