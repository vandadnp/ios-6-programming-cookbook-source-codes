//
//  AppDelegate.m
//  Listening for Notifications Sent From NSNotificationCenter
//
//  Created by Vandad Nahavandipoor on 19/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/* The notification name */
const NSString *ResultOfAppendingTwoStringsNotification = 
                @"ResultOfAppendingTwoStringsNotification";

/* Keys inside the dictionary that our notification sends */
const NSString 
  *ResultOfAppendingTwoStringsFirstStringInfoKey = @"firstString";

const NSString 
  *ResultOfAppendingTwoStringsSecondStringInfoKey = @"secondString";

const NSString 
  *ResultOfAppendingTwoStringsResultStringInfoKey = @"resultString";

- (void) broadcastNotification{
  
  NSString *firstName = @"Anthony";
  NSString *lastName = @"Robbins";
  NSString *fullName = [firstName stringByAppendingString:lastName];
  
  NSArray *objects = [[NSArray alloc] initWithObjects:
                      firstName,
                      lastName,
                      fullName,
                      nil];
  
  NSArray *keys = [[NSArray alloc] initWithObjects:
                   ResultOfAppendingTwoStringsFirstStringInfoKey,
                   ResultOfAppendingTwoStringsSecondStringInfoKey,
                   ResultOfAppendingTwoStringsResultStringInfoKey,
                   nil];
  
  NSDictionary *userInfo = [[NSDictionary alloc] initWithObjects:objects
                                                         forKeys:keys];
  
  NSNotification *notificationObject = 
  [NSNotification 
   notificationWithName:(NSString *)ResultOfAppendingTwoStringsNotification
   object:self
   userInfo:userInfo];
  
  [[NSNotificationCenter defaultCenter] postNotification:notificationObject];
  
}

- (void) appendingIsFinished:(NSNotification *)paramNotification{
  
  NSLog(@"Notification is received.");
  NSLog(@"Notification Object = %@", [paramNotification object]);
  NSLog(@"Notification User-Info Dict = %@", [paramNotification userInfo]);
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  
  /* Listen for the notification */
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(appendingIsFinished:) 
   name:(NSString *)ResultOfAppendingTwoStringsNotification
   object:self];
  
  [self broadcastNotification];
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
  
}

- (void)applicationWillTerminate:(UIApplication *)application{
  /* We no longer observe ANY notifications */
  [[NSNotificationCenter defaultCenter] removeObserver:self];
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

@end
