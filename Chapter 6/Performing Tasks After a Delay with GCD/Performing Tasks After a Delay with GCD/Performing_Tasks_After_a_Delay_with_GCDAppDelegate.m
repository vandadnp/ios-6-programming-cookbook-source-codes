//
//  Performing_Tasks_After_a_Delay_with_GCDAppDelegate.m
//  Performing Tasks After a Delay with GCD
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Performing_Tasks_After_a_Delay_with_GCDAppDelegate.h"

void processSomething(void *paramContext);

@implementation Performing_Tasks_After_a_Delay_with_GCDAppDelegate

//- (void) printString:(NSString *)paramString{
//  NSLog(@"%@", paramString);
//}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  [self performSelector:@selector(printString:)
//             withObject:@"Grand Central Dispatch"
//             afterDelay:3.0];
//
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  // Override point for customization after application launch.
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}


void processSomething(void *paramContext){
  /* Do your processing here */
  NSLog(@"Processing...");
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

  double delayInSeconds = 2.0;
  
  dispatch_time_t delayInNanoSeconds = 
    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
  
  dispatch_queue_t concurrentQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_after_f(delayInNanoSeconds, 
                   concurrentQueue, 
                   NULL,
                   processSomething);

  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}


//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//
//  double delayInSeconds = 2.0;
//  
//  dispatch_time_t delayInNanoSeconds = 
//    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//  
//  dispatch_queue_t concurrentQueue = 
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){
//    /* Perform your operations here */
//  });
//
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  // Override point for customization after application launch.
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    self.window = [[UIWindow alloc] initWithFrame:
//                   [[UIScreen mainScreen] bounds]];
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
