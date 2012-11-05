//
//  Determining_if_Instance_or_Class_Methods_are_AvailableAppDelegate.m
//  Determining if Instance or Class Methods are Available
//
//  Created by Vandad Nahavandipoor on 08/08/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Determining_if_Instance_or_Class_Methods_are_AvailableAppDelegate.h"

@implementation Determining_if_Instance_or_Class_Methods_are_AvailableAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
  /* 1 */
//  NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
//                           @"Item 1",
//                           @"Item 4",
//                           @"Item 2",
//                           @"Item 5",
//                           @"Item 3", nil];
//  
//  NSLog(@"Array = %@", array);
//  
//  if ([NSArray instancesRespondToSelector:@selector(sortUsingComparator:)]){
//    
//    /* Use the sortUsingComparator: instance method of the array to sort it */
//    
//  }
//  else if ([NSArray instancesRespondToSelector:
//            @selector(sortUsingFunction:context:)]){
//    
//    /* Use the sortUsingFunction:context: instance 
//     method of the array to sort */
//    
//  }
//  else {
//    
//    /* Do something else */
//    
//  }
  
  /* 2 */
//  NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
//                           @"Item 1",
//                           @"Item 4",
//                           @"Item 2",
//                           @"Item 5",
//                           @"Item 3", nil];
//  
//  NSLog(@"Array = %@", array);
//  
//  if ([array respondsToSelector:@selector(sortUsingComparator:)]){
//    
//    /* Use the sortUsingComparator: instance method of the array to sort it */
//    
//  }
//  else if ([array respondsToSelector:@selector(sortUsingFunction:context:)]){
//    
//    /* Use the sortUsingFunction:context: instance 
//     method of the array to sort */
//    
//  }
//  else {
//    
//    /* Do something else */
//    
//  }
  
  /* 3 */
  NSArray *array = nil;
  
  if ([NSArray respondsToSelector:@selector(arrayWithObjects:count:)]){
    NSString *strings[4];
    strings[0] = @"String 1";
    strings[1] = @"String 2";
    strings[2] = @"String 3";
    strings[3] = @"String 4";
    
    array = [NSArray arrayWithObjects:strings
                                count:4];
  }
  else if ([NSArray respondsToSelector:@selector(arrayWithObjects:)]){
    array = [NSArray arrayWithObjects:
             @"String 1",
             @"String 2",
             @"String 3",
             @"String 4",
             nil];
  }
  else {
    /* Do something else */
  }
  
  NSLog(@"Array = %@", array);
  
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
