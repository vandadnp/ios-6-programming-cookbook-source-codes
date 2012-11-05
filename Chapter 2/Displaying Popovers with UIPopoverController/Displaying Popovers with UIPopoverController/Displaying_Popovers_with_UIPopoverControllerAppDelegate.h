//
//  Displaying_Popovers_with_UIPopoverControllerAppDelegate.h
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad Nahavandipoor on 28/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Displaying_Popovers_with_UIPopoverControllerViewController;

@interface Displaying_Popovers_with_UIPopoverControllerAppDelegate 
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) 
  Displaying_Popovers_with_UIPopoverControllerViewController *viewController;

@property (nonatomic, strong) UINavigationController *navigationController;

@end
