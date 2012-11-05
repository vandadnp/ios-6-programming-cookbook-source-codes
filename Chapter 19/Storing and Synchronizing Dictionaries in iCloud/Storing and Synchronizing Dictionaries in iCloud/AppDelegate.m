//
//  AppDelegate.m
//  Storing and Synchronizing Dictionaries in iCloud
//
//  Created by Vandad Nahavandipoor on 21/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  NSUbiquitousKeyValueStore *kvoStore = 
    [NSUbiquitousKeyValueStore defaultStore];
  
  NSString *stringValue = @"My String";
  NSString *stringValueKey = @"MyStringKey";
  
  BOOL boolValue = YES;
  NSString *boolValueKey = @"MyBoolKey";
  
  BOOL mustSynchronize = NO;
  
  if ([[kvoStore stringForKey:stringValueKey] length] == 0){
    NSLog(@"Could not find the string value in iCloud. Setting...");
    [kvoStore setString:stringValue
                 forKey:stringValueKey];
    mustSynchronize = YES;
  } else {
    NSLog(@"Found the string in iCloud, getting...");
    stringValue = [kvoStore stringForKey:stringValueKey];
  }
  
  if ([kvoStore boolForKey:boolValueKey] == NO){
    NSLog(@"Could not find the boolean value in iCloud. Setting...");
    [kvoStore setBool:boolValue
               forKey:boolValueKey];
    mustSynchronize = YES;
  } else {
    NSLog(@"Found the boolean in iCloud, getting...");
    boolValue = [kvoStore boolForKey:boolValueKey];
  }
  
  if (mustSynchronize){
    if ([kvoStore synchronize]){
      NSLog(@"Successfully synchronized with iCloud.");
    } else {
      NSLog(@"Failed to synchronize with iCloud.");
    }
  }
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
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
