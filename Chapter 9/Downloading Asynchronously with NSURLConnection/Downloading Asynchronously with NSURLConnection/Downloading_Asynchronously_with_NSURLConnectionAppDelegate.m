//
//  Downloading_Asynchronously_with_NSURLConnectionAppDelegate.m
//  Downloading Asynchronously with NSURLConnection
//
//  Created by Vandad Nahavandipoor on 19/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Downloading_Asynchronously_with_NSURLConnectionAppDelegate.h"

@implementation Downloading_Asynchronously_with_NSURLConnectionAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
/* 1 */
//  NSString *urlAsString = @"http://www.apple.com";
//  NSURL *url = [NSURL URLWithString:urlAsString];
//  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//  
//  [NSURLConnection
//   sendAsynchronousRequest:urlRequest
//   queue:queue
//   completionHandler:^(NSURLResponse *response, 
//                       NSData *data, 
//                       NSError *error) {
//     
//     if ([data length] >0  &&
//         error == nil){
//       NSString *html = [[NSString alloc] initWithData:data
//                                              encoding:NSUTF8StringEncoding];
//       NSLog(@"HTML = %@", html);
//     }
//     else if ([data length] == 0 &&
//              error == nil){
//       NSLog(@"Nothing was downloaded.");
//     }
//     else if (error != nil){
//       NSLog(@"Error happened = %@", error);
//     }
//     
//   }];
  
  /* 2 */
  NSString *urlAsString = @"http://www.apple.com";
  NSURL *url = [NSURL URLWithString:urlAsString];
  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  
  [NSURLConnection
   sendAsynchronousRequest:urlRequest
   queue:queue
   completionHandler:^(NSURLResponse *response, 
                       NSData *data, 
                       NSError *error) {
     
     if ([data length] >0  &&
         error == nil){
       
       /* Get the documents directory */
       NSString *documentsDir = 
       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                            NSUserDomainMask, 
                                            YES) objectAtIndex:0];
       
       /* Append the file name to the documents directory */
       NSString *filePath = [documentsDir 
                             stringByAppendingPathComponent:@"apple.html"];
       
       /* Write the data to the file */
       [data writeToFile:filePath
              atomically:YES];
       
       NSLog(@"Successfully saved the file to %@", filePath);
       
     }
     else if ([data length] == 0 &&
              error == nil){
       NSLog(@"Nothing was downloaded.");
     }
     else if (error != nil){
       NSLog(@"Error happened = %@", error);
     }
     
   }];
  
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
