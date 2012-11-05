//
//  Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate.h
//  Presenting Multiple View Controllers with UITabBar
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@class FirstViewController;
//@class SecondViewController;
//
//@interface Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate
//           : UIResponder <UIApplicationDelegate>
//
//@property (nonatomic, strong) UIWindow *window;
//@property (nonatomic, strong) FirstViewController *firstViewController;
//@property (nonatomic, strong) SecondViewController *secondViewController;
//@property (nonatomic, strong) UITabBarController *tabBarController;
//
//@end

/* 2 */
#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;

@interface Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) FirstViewController *firstViewController;
@property (nonatomic, strong) 
  UINavigationController *firstNavigationController;

@property (nonatomic, strong) SecondViewController *secondViewController;
@property (nonatomic, strong) 
  UINavigationController *secondNavigationController;

@property (nonatomic, strong) UITabBarController *tabBarController;

@end
