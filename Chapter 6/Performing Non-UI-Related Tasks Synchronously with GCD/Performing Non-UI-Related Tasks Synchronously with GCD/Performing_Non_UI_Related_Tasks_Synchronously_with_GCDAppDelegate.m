//
//  Performing_Non_UI_Related_Tasks_Synchronously_with_GCDAppDelegate.m
//  Performing Non-UI-Related Tasks Synchronously with GCD
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Performing_Non_UI_Related_Tasks_Synchronously_with_GCDAppDelegate.h"

void printFrom1To1000(void *paramContext);

@implementation Performing_Non_UI_Related_Tasks_Synchronously_with_GCDAppDelegate

//void (^printFrom1To1000)(void) = ^{
//  
//  NSUInteger counter = 0;
//  for (counter = 1;
//       counter <= 1000;
//       counter++){ 
//    
//    NSLog(@"Counter = %lu - Thread = %@",
//          (unsigned long)counter,
//          [NSThread currentThread]);
//    
//  }
//  
//};

//- (BOOL)              application:(UIApplication *)application 
//    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_queue_t concurrentQueue = 
//  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_sync(concurrentQueue, printFrom1To1000);
//  dispatch_sync(concurrentQueue, printFrom1To1000);
//  
//  // Override point for customization after application launch.
//  [self.window makeKeyAndVisible];
//  return YES;
//}


void printFrom1To1000(void *paramContext){
  
  NSUInteger counter = 0;
  for (counter = 1;
       counter <= 1000;
       counter++){ 
    
    NSLog(@"Counter = %lu - Thread = %@",
          (unsigned long)counter,
          [NSThread currentThread]);
    
  }
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_queue_t concurrentQueue = 
  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_sync_f(concurrentQueue, 
                  NULL,
                  printFrom1To1000);
  
  dispatch_sync_f(concurrentQueue, 
                  NULL,
                  printFrom1To1000);
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
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
