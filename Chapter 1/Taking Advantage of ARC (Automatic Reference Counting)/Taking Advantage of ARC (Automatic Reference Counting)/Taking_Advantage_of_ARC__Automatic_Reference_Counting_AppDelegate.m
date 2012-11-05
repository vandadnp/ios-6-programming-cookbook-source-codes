//
//  Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate.m
//  Taking Advantage of ARC (Automatic Reference Counting)
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate.h"

@implementation Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate

@synthesize window = _window;
@synthesize myFirstName;
@synthesize yourFirstName;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  
  self.myFirstName = @"Vandad";
  __weak NSString *myString = self.myFirstName;
  
  NSLog(@"myFirstName = %@", self.myFirstName);
  NSLog(@"yourFirstName = %@", myString);
  
  self.myFirstName = nil;
  
  NSLog(@"myFirstName = %@", self.myFirstName);
  NSLog(@"yourFirstName = %@", myString);
  
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
