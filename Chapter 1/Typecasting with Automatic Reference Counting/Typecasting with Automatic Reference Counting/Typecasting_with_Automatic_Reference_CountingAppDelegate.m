//
//  Typecasting_with_Automatic_Reference_CountingAppDelegate.m
//  Typecasting with Automatic Reference Counting
//
//  Created by Vandad Nahavandipoor on 25/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Typecasting_with_Automatic_Reference_CountingAppDelegate.h"

@implementation Typecasting_with_Automatic_Reference_CountingAppDelegate

@synthesize window = _window;

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  CFStringRef coreFoundationString = 
//  CFStringCreateWithCString(CFAllocatorGetDefault(), 
//                            "C String", 
//                            kCFStringEncodingUTF8);
//  
//  /* Compile time error!!! */
//  NSString *objCString = coreFoundationString;
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 2 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  CFStringRef coreFoundationString = 
//  CFStringCreateWithCString(CFAllocatorGetDefault(), 
//                            "C String", 
//                            kCFStringEncodingUTF8);
//  
//  /* Compile time error!!! */
//  NSString *objCString = (__bridge_transfer NSString *)coreFoundationString;
//  
//  NSLog(@"String = %@", objCString);
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 3 */
- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  CFStringRef coreFoundationString = 
  CFStringCreateWithCString(CFAllocatorGetDefault(), 
                            "C String", 
                            kCFStringEncodingUTF8);
  
  id unknownObjectType = (__bridge id)coreFoundationString;
  
  CFStringRef anotherString = (__bridge_retained CFStringRef)unknownObjectType;
  
  NSString *objCString = (__bridge_transfer NSString *)coreFoundationString;
  NSLog(@"String = %@", objCString);
  objCString = nil;
  
  CFRelease(anotherString);
  
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
