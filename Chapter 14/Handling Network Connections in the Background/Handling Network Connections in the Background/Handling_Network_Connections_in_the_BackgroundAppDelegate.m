//
//  Handling_Network_Connections_in_the_BackgroundAppDelegate.m
//  Handling Network Connections in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Handling_Network_Connections_in_the_BackgroundAppDelegate.h"

@implementation Handling_Network_Connections_in_the_BackgroundAppDelegate

///* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  NSString *urlAsString = @"http://www.apple.com";
//  NSURL *url = [NSURL URLWithString:urlAsString];
//  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//  
//  [NSURLConnection 
//   sendAsynchronousRequest:urlRequest
//   queue:queue
//   completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//     
//     if ([data length] > 0 &&
//         error != nil){
//       /* Date did come back */
//     }
//     else if ([data length] == 0 &&
//              error != nil){
//       /* No data came back */
//     }
//     else if (error != nil){
//       /* Error happened. Make sure you handle this properly */
//     }
//     
//   }];
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
//  /* Replace this URL with the URL of a file that is rather big in size */
//  NSString *urlAsString = @"http://www.apple.com";
//  NSURL *url = [NSURL URLWithString:urlAsString];
//  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//  NSError *error = nil;
//  
//  NSData *connectionData = [NSURLConnection  sendSynchronousRequest:urlRequest
//                                                  returningResponse:nil
//                                                              error:&error];
//  
//  if ([connectionData length] > 0 &&
//      error == nil){
//    
//  }
//  else if ([connectionData length] == 0 &&
//           error == nil){
//    
//  }
//  else if (error != nil){
//    
//  }
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 3 */
- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_queue_t dispatchQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
    
    /* Replace this URL with the URL of a file that is rather big in size */
    NSString *urlAsString = @"http://www.apple.com";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSError *error = nil;
    
    NSData *connectionData = [NSURLConnection  sendSynchronousRequest:urlRequest
                                                    returningResponse:nil
                                                                error:&error];
    
    if ([connectionData length] > 0 &&
        error == nil){
      
    }
    else if ([connectionData length] == 0 &&
             error == nil){
      
    }
    else if (error != nil){
      
    }
  });
  
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
