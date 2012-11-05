//
//  Allocating_and_Making_Use_of_DictionariesAppDelegate.m
//  Allocating and Making Use of Dictionaries
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Allocating_and_Making_Use_of_DictionariesAppDelegate.h"

@implementation Allocating_and_Making_Use_of_DictionariesAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  
  /* 1 */
//NSArray *person = @[
//@"Anthony",
//@"Robbins",
//@51];
//
//NSLog(@"First Name = %@", person[0]);
//NSLog(@"Last Name = %@", person[1]);
//NSLog(@"Age = %@", person[2]);
  
  /* 2 */
//NSDictionary *person = @{
//@"First Name" : @"Anthony",
//@"Last Name" : @"Robbins",
//@"Age" : @51
//};
//
//NSLog(@"First Name = %@", person[@"First Name"]);
//NSLog(@"Last Name = %@", person[@"Last Name"]);
//NSLog(@"Age = %@", person[@"Age"]);
    
  /* 3 */
NSMutableDictionary *person = [@{
                                @"First Name" : @"Anthony",
                                @"Last Name" : @"Robbins",
                                @"Age" : @51
                               } mutableCopy];

[person removeObjectForKey:@"Age"];

NSLog(@"First Name = %@", person[@"First Name"]);
NSLog(@"Last Name = %@", person[@"Last Name"]);
NSLog(@"Age = %@", person[@"Age"]);

  
  /* 4 */
//NSDictionary *person = @{
//@"First Name" : @"Anthony",
//@"Last Name" : @"Robbins",
//@"Age" : @51
//};
//
//[person enumerateKeysAndObjectsUsingBlock:
// ^(__strong id key, __strong id obj, BOOL *stop) {
//     
//     NSLog(@"Key = %@, Object For Key = %@", key, obj);
//     
// }];

  /* 5 */
//NSDictionary *person = @{
//@"First Name" : @"Anthony",
//@"Last Name" : @"Robbins",
//@"Age" : @51
//};
//
//for (id keyInDictionary in [person allKeys]){
//    
//    id objectForKey = [person objectForKey:keyInDictionary];
//    NSLog(@"Key = %@, Object For Key = %@", keyInDictionary, objectForKey);
//    
//}
  
  /* 6 */
//NSDictionary *person = @{
//@"First Name" : @"Anthony",
//@"Last Name" : @"Robbins",
//@"Age" : @51
//};
//  
//NSEnumerator *keys = [person keyEnumerator];
//id keyInDictionary = nil;
//
//while ((keyInDictionary = [keys nextObject]) != nil){
//  
//  id objectForKey = [person objectForKey:keyInDictionary];
//  NSLog(@"Key = %@, Object For Key = %@", keyInDictionary, objectForKey);
//  
//}
  
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
