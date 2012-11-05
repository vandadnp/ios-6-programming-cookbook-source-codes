//
//  Presenting_and_Managing_Views_with_UIViewControllerAppDelegate.h
//  Presenting and Managing Views with UIViewController
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Presenting_and_Managing_Views_with_UIViewControllerAppDelegate : 
           UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) RootViewController *rootViewController;

@end
