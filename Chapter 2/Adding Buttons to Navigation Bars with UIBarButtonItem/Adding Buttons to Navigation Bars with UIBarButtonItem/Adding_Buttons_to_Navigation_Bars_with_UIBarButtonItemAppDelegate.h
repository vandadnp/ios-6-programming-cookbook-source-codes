//
//  Adding_Buttons_to_Navigation_Bars_with_UIBarButtonItemAppDelegate.h
//  Adding Buttons to Navigation Bars with UIBarButtonItem
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Adding_Buttons_to_Navigation_Bars_with_UIBarButtonItemAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) RootViewController *rootViewController;

@end
