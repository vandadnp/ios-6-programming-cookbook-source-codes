//
//  Downloading_Synchronously_with_NSURLConnectionAppDelegate.m
//  Downloading Synchronously with NSURLConnection
//
//  Created by Vandad Nahavandipoor on 19/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Downloading_Synchronously_with_NSURLConnectionAppDelegate.h"

@implementation Downloading_Synchronously_with_NSURLConnectionAppDelegate

/* 1 */
//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  NSLog(@"We are here...");
//  
//  NSString *urlAsString = @"http://www.yahoo.com";
//  NSURL *url = [NSURL URLWithString:urlAsString];
//  
//  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//  
//  NSURLResponse *response = nil;
//  NSError *error = nil;
//  
//  NSLog(@"Firing synchronous url connection...");
//  NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
//                                       returningResponse:&response
//                                                   error:&error];
//  
//  if ([data length] > 0 &&
//      error == nil){
//    NSLog(@"%lu bytes of data was returned.", (unsigned long)[data length]);    
//  }
//  else if ([data length] == 0 &&
//           error == nil){
//    NSLog(@"No data was returned.");
//  }
//  else if (error != nil){
//    NSLog(@"Error happened = %@", error);
//  }
//  
//  NSLog(@"We are done.");
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 2 */
- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  NSLog(@"We are here...");
  
  NSString *urlAsString = @"http://www.yahoo.com";
  
  NSLog(@"Firing synchronous url connection...");
  
  dispatch_queue_t dispatchQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
    
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:&response
                                                     error:&error];
    
    if ([data length] > 0 &&
        error == nil){
      NSLog(@"%lu bytes of data was returned.", (unsigned long)[data length]);
    }
    else if ([data length] == 0 &&
             error == nil){
      NSLog(@"No data was returned.");
    }
    else if (error != nil){
      NSLog(@"Error happened = %@", error);
    }
  });
  
  
  NSLog(@"We are done.");
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
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
