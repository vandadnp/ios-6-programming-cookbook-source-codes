//
//  Creating_Concurrency_with_ThreadsAppDelegate.h
//  Creating Concurrency with Threads
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Creating_Concurrency_with_ThreadsAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) RootViewController *rootViewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end
