//
//  Allocating_and_Making_Use_of_ArraysAppDelegate.m
//  Allocating and Making Use of Arrays
//
//  Created by Vandad Nahavandipoor on 06/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Allocating_and_Making_Use_of_ArraysAppDelegate.h"

@implementation Allocating_and_Making_Use_of_ArraysAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self.window makeKeyAndVisible];
  
  /* 1 */
//NSArray *array = @[@"My String", @123, @-123];
//NSLog(@"array = %@", array);
  
  /* 2 */  
//NSArray *array = @[@"My String", @123, @-123];
//
//NSUInteger counter = 0;
//for (counter = 0;
//     counter < [array count];
//     counter++){
//    
//    id object = array[counter];
//    NSLog(@"Object = %@", object);
//    
//}
  
  /* 3 */
//NSArray *array = @[@"My String", @123, @-123];
//
//for (id object in array){
//  NSLog(@"Object = %@", object);
//}

  /* 4 */
    
NSArray *anotherArray = @[@"String 1", @"String 2", @"String 3"];

NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:
                                @[@"My String", @123, @-123]];

[mutableArray addObject:@123];
[mutableArray removeObject:@-123];
[mutableArray addObjectsFromArray:anotherArray];

for (id object in mutableArray){
    NSLog(@"Object = %@", object);
}
  
  /* 6 */
//NSArray *myArray = @[
//@"String 1",
//@"String 2",
//@"String 3",
//@"String 4"];
//
//[myArray enumerateObjectsUsingBlock:
//^(__strong id obj, NSUInteger idx, BOOL *stop) {
// NSLog(@"Object = %@", obj);
//}];
    

  /* 7 */
//NSMutableArray *myArray = [NSMutableArray arrayWithArray:@[
//                         @"String 2",
//                         @"String 4",
//                         @"String 1",
//                         @"String 3"]];
//
//[myArray sortUsingComparator:
//^NSComparisonResult(__strong id obj1, __strong id obj2) {
//   
//NSString *string1 = (NSString *)obj1;
//NSString *string2 = (NSString *)obj2;
//return [string1 compare:string2];
//
//}];
//
//NSLog(@"myArray = %@", myArray);
//
//NSLog(@"%d", [@"String 3" compare:@"String 1"]);
  
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
