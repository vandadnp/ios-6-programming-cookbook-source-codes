//
//  Allocating_and_Making_Use_of_StringsAppDelegate.m
//  Allocating and Making Use of Strings
//
//  Created by Vandad Nahavandipoor on 06/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Allocating_and_Making_Use_of_StringsAppDelegate.h"

@implementation Allocating_and_Making_Use_of_StringsAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Override point for customization after application launch.
  [self.window makeKeyAndVisible];
  
  /* 1 */
//NSString *simpleString = @"This is a simple string";
//
//NSString *anotherString = 
//  [NSString stringWithString:@"This is another simple string"];
//
//NSString *oneMorestring = 
//  [[NSString alloc] initWithString:@"One more!"];
//
//NSMutableString *mutableOne = 
//  [NSMutableString stringWithString:@"Mutable String"];
//
//NSMutableString *anotherMutableOne = 
//  [[NSMutableString alloc] initWithString:@"A retained one"];
//
//NSMutableString *thirdMutableOne = 
//  [NSMutableString stringWithString:simpleString];
  
  
  /* 2 */
//NSString *userName = ...;
//
//if ([userName length] == 0){
//  /* The user didn't enter her name */
//} else {
//  /* The user did in face enter her name */
//}
  
  /* 3 */
//NSString *simpleString = @"123.456";
//
//NSInteger integerOfString = [simpleString integerValue];
//NSLog(@"integerOfString = %ld", (long)integerOfString);
//
//CGFloat floatOfString = [simpleString floatValue];
//NSLog(@"floatOfString = %f", floatOfString);
//
//double doubleOfString = [simpleString doubleValue];
//NSLog(@"doubleOfString = %f", doubleOfString);
  
  /* 4 */
//char *cString = "This is a C String";
  
  /* 5 */
//const char *cString = [@"Objective-C String" UTF8String];
//NSLog(@"cString = %s", cString);
  
  /* 6 */
//NSString *objectString = [NSString stringWithUTF8String:"C String"];
//NSLog(@"objectString = %@", objectString);
  
  /* 7 */
//NSString *haystack = @"My Simple String";
//NSString *needle = @"Simple";
//NSRange  range = [haystack rangeOfString:needle];
//
//if (range.location == NSNotFound){
//  /* Could NOT find needle in haystack */
//} else {
//  /* Found the needle in the haystack */
//  NSLog(@"Found %@ in %@ at location %lu",
//        needle,
//        haystack,
//        (unsigned long)range.location);
//}
  
  
  /* 8 */
//NSString *haystack = @"My Simple String";
//NSString *needle = @"simple";
//NSRange  range = [haystack rangeOfString:needle 
//                                 options:NSCaseInsensitiveSearch];
//
//if (range.location == NSNotFound){
//  /* Could NOT find needle in haystack */
//} else {
//  /* Found the needle in the haystack */
//  NSLog(@"Found %@ in %@ at location %lu",
//        needle,
//        haystack,
//        (unsigned long)range.location);
//}
  
  /* 9 */
//NSMutableString *mutableString = 
//  [[NSMutableString alloc] initWithString:@"My MacBook"];
//
///* Add string to the end of this string */
//[mutableString appendString:@" Pro"];
//
///* Remove the "My " string from the string */
//[mutableString 
// replaceOccurrencesOfString:@"My "
// withString:[NSString string] /* Empty string */
// options:NSCaseInsensitiveSearch /* Case-insensitive */
// range:NSMakeRange(0, [mutableString length])]; /* All to the end */
//
//NSLog(@"mutableString = %@", mutableString);
  
  
  
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
