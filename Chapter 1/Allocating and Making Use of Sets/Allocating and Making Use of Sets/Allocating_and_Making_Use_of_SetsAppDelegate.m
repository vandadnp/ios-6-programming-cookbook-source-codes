//
//  Allocating_and_Making_Use_of_SetsAppDelegate.m
//  Allocating and Making Use of Sets
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Allocating_and_Making_Use_of_SetsAppDelegate.h"

@implementation Allocating_and_Making_Use_of_SetsAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];

  /* 1 */
//NSString *hisName = @"Robert";
//NSString *hisLastName = @"Kiyosaki";
//
//NSString *herName = @"Kim";
//NSString *herLastName = @"Kiyosaki";
//
//NSSet *setOfNames = [[NSSet alloc] initWithObjects:
//                     hisName,
//                     hisLastName,
//                     herName,
//                     herLastName, nil];
//
//NSLog(@"Set = %@", setOfNames);
  
  /* 2 */
//NSString *hisName = @"Robert";
//NSString *hisLastName = @"Kiyosaki";
//
//NSString *herName = @"Kim";
//NSString *herLastName = @"Kiyosaki";
//
//NSMutableSet *setOfNames = [[NSMutableSet alloc] initWithObjects:
//                          hisName,
//                          hisLastName, nil];
//
//[setOfNames addObject:herName];
//[setOfNames addObject:herLastName];
//  
//NSLog(@"Set = %@", setOfNames);
  
  /* 3 */
//NSString *hisName = @"Robert";
//NSString *hisLastName = @"Kiyosaki";
//
//NSString *herName = @"Kim";
//NSString *herLastName = @"Kiyosaki";
//  
//NSMutableSet *setOfNames = [[NSMutableSet alloc] initWithObjects:
//                            hisName,
//                            hisLastName, 
//                            herName,
//                            herLastName, nil];
//
//[setOfNames removeObject:@"Kiyosaki"];
//  
//NSLog(@"Set = %@", setOfNames);
  
  /* 4 */
//NSString *hisName = @"Robert";
//NSString *hisLastName = @"Kiyosaki";
//
//NSString *herName = @"Kim";
//NSString *herLastName = @"Kiyosaki";
//
//NSSet *setOfNames = [[NSSet alloc] initWithObjects:
//                     hisName,
//                     hisLastName, 
//                     herName,
//                     herLastName, nil];
//
//[setOfNames enumerateObjectsUsingBlock:^(__strong id obj, BOOL *stop) {
//  
//  if ([obj isKindOfClass:[NSString class]]){
//    NSString *string = (NSString *)obj;
//    if ([string isEqualToString:@"Kiyosaki"]){
//      NSLog(@"Found %@ in the set", string);
//      *stop = YES;
//    }
//  }
//  
//}];
  
  
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
