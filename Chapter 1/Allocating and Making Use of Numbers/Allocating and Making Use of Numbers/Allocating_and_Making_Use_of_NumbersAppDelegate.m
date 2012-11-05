//
//  Allocating_and_Making_Use_of_NumbersAppDelegate.m
//  Allocating and Making Use of Numbers
//
//  Created by Vandad Nahavandipoor on 06/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Allocating_and_Making_Use_of_NumbersAppDelegate.h"

@implementation Allocating_and_Making_Use_of_NumbersAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  
  /* 1 */
//NSNumber *signedNumber = @-123456;
//NSNumber *unsignedNumber = @123456;
//NSNumber *floatNumber = @123456.123456f;
//NSNumber *doubleNumber = @123456.1234567890;
  
  /* 2 */
//NSNumber *signedNumber = @-123456;
//NSNumber *unsignedNumber = @123456;
//NSNumber *floatNumber = @123.123456f;
//NSNumber *doubleNumber = @123.1234567890;
//
//NSInteger signedValue = [signedNumber integerValue];
//NSUInteger unsignedValue = [unsignedNumber unsignedIntegerValue];
//CGFloat floatValue = [floatNumber floatValue];
//double doubleValue = [doubleNumber doubleValue];
//
//NSLog(@"signedValue  = %ld, \n"\
//      "unsignedValue = %lu  \n"\
//      "floatValue    = %f   \n"\
//      "doubleValue   = %f",
//      (long)signedValue,
//      (unsigned long)unsignedValue,
//      floatValue,
//      doubleValue);
  
///* 3 */
//NSNumber *unsignedNumber = @123456;
//
///* Convert an unsigned integer inside an NSNumber to NSString */
//NSString *stringValueOfNumber =
//[NSString stringWithFormat:@"%lu",
// (unsigned long)[unsignedNumber unsignedIntegerValue]];
//
//NSLog(@"String from Number = %@", stringValueOfNumber);
  
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

- (void)dealloc
{
  [_window release];
  [super dealloc];
}

@end
