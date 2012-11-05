//
//  Moving_from_Manual_Reference_Counting_to_ARCAppDelegate.m
//  Moving from Manual Reference Counting to ARC
//
//  Created by Vandad Nahavandipoor on 25/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Moving_from_Manual_Reference_Counting_to_ARCAppDelegate.h"

@implementation Moving_from_Manual_Reference_Counting_to_ARCAppDelegate

/* 1 */
//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  self.string1 = @"String 1";
//  self.string2 = self.string1;
//  self.string1 = nil;
//  
//  NSLog(@"String 2 = %@", self.string2);
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
//  /* All local variables are by default strong so just emphasis that. We
//   really don't have to mention __strong for the first variable but
//   to make it clear, we will set it. No harm in doing so. */
//  __strong NSString *yourString = @"Your String";
//  __weak   NSString *myString = yourString;
//  yourString = nil;
//  __unsafe_unretained NSString *theirString = myString;
//  
//  /* All pointers will be nil at this time */
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 3 */
//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  self.string1 = [[NSString alloc] initWithUTF8String:"String 1"];
//  self.string2 = self.string1;
//  self.string1 = nil;
//  
//  /* All pointers will be nil at this time */
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application{
//  NSLog(@"String 2 = %@", self.string2);
//}

/* 4 */
- (void) generateErrorInVariable:(__autoreleasing NSError **)paramError{
  
  NSArray *objects = [[NSArray alloc] initWithObjects:@"A simple error", nil];
  
  NSArray *keys = 
  [[NSArray alloc] initWithObjects:NSLocalizedDescriptionKey, nil];
  
  NSDictionary *errorDictionary = [[NSDictionary alloc] initWithObjects:objects
                                                                forKeys:keys];
  
  *paramError = [[NSError alloc] initWithDomain:@"MyApp"
                                           code:1
                                       userInfo:errorDictionary];
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  NSError *error = nil;
  [self generateErrorInVariable:&error];
  
  NSLog(@"Error = %@", error);
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
