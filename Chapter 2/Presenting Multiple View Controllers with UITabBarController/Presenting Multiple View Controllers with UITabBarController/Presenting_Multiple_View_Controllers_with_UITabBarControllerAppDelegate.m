//
//  Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate.m
//  Presenting Multiple View Controllers with UITabBar
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation Presenting_Multiple_View_Controllers_with_UITabBarControllerAppDelegate

/* 1 */
//
//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  // Override point for customization after application launch.
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  [self.window makeKeyAndVisible];
//  
//  self.firstViewController = [[FirstViewController alloc]
//                              initWithNibName:nil
//                              bundle:NULL];
//  self.secondViewController = [[SecondViewController alloc]
//                               initWithNibName:nil
//                               bundle:NULL];
//  
//  NSArray *twoViewControllers = [[NSArray alloc]
//                                 initWithObjects:
//                                 self.firstViewController,
//                                 self.secondViewController, nil];
//  
//  self.tabBarController = [[UITabBarController alloc] init];
//  [self.tabBarController setViewControllers:twoViewControllers];
//  
//  [self.window addSubview:self.tabBarController.view];
//  
//  return YES;
//  
//}

/* 2 */

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  [self.window makeKeyAndVisible];
  
  self.firstViewController = [[FirstViewController alloc]
                              initWithNibName:nil
                              bundle:NULL];
  self.firstNavigationController = 
    [[UINavigationController alloc]
     initWithRootViewController:self.firstViewController];
  
  self.secondViewController = [[SecondViewController alloc]
                               initWithNibName:nil
                               bundle:NULL];
  self.secondNavigationController = 
    [[UINavigationController alloc]
     initWithRootViewController:self.secondViewController];
                                     
  NSArray *twoNavControllers = [[NSArray alloc]
                                 initWithObjects:
                                 self.firstNavigationController,
                                 self.secondNavigationController, nil];
  
  self.tabBarController = [[UITabBarController alloc] init];
  [self.tabBarController setViewControllers:twoNavControllers];
  
  [self.window addSubview:self.tabBarController.view];
  
  return YES;
  
}


- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
