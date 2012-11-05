//
//  Performing_a_Task_at_Most_Once_with_GCDAppDelegate.m
//  Performing a Task at Most Once with GCD
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Performing_a_Task_at_Most_Once_with_GCDAppDelegate.h"

@implementation Performing_a_Task_at_Most_Once_with_GCDAppDelegate

static dispatch_once_t onceToken;

void (^executedOnlyOnce)(void) = ^{
  
  static NSUInteger numberOfEntries = 0;
  numberOfEntries++;
  NSLog(@"Executed %lu time(s)", (unsigned long)numberOfEntries);
  
};


- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_queue_t concurrentQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_once(&onceToken, ^{
    dispatch_async(concurrentQueue, 
                   executedOnlyOnce);
  });
  
  dispatch_once(&onceToken, ^{
    dispatch_async(concurrentQueue, 
                   executedOnlyOnce);
  });
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
  
}

//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  MySingleton *obj1 = [MySingleton sharedInstance];
//  MySingleton *obj2 = [MySingleton sharedInstance];
//  MySingleton *obj3 = [MySingleton sharedInstance];
//  
//  NSLog(@"Object 1 = %@", obj1);
//  NSLog(@"Object 2 = %@", obj2);
//  NSLog(@"Object 3 = %@", obj3);
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//  
//}
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

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
