//
//  AppDelegate.m
//  Loading Data From Other Bundles
//
//  Created by Vandad Nahavandipoor on 18/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  NSString *resourcesBundlePath = 
//  [[NSBundle mainBundle] pathForResource:@"Resources"
//                                  ofType:@"bundle"];
//  
//  if ([resourcesBundlePath length] > 0){
//    
//    NSBundle *resourcesBundle = [NSBundle bundleWithPath:resourcesBundlePath];
//    
//    if (resourcesBundle != nil){
//      
//      NSString *pathToAlanSugarImage = 
//      [resourcesBundle pathForResource:@"AlanSugar"
//                                ofType:@"png"
//                           inDirectory:@"Images"];
//      
//      if ([pathToAlanSugarImage length] > 0){
//        
//        UIImage *image = [UIImage imageWithContentsOfFile:pathToAlanSugarImage];
//        
//        if (image != nil){
//          NSLog(@"Successfully loaded the image from the bundle.");
//        } else {
//          NSLog(@"Failed to load the image.");
//        }
//        
//      } else {
//        NSLog(@"Failed to find the file inside the bundle.");
//      }
//      
//    } else {
//      NSLog(@"Failed to load the bundle.");
//    }
//    
//  } else {
//    NSLog(@"Could not find the bundle.");
//  }
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
  
  NSString *resourcesBundlePath = 
  [[NSBundle mainBundle] pathForResource:@"Resources"
                                  ofType:@"bundle"];
  
  if ([resourcesBundlePath length] > 0){
    
    NSBundle *resourcesBundle = [NSBundle bundleWithPath:resourcesBundlePath];
    
    if (resourcesBundle != nil){
      
      NSArray *PNGPaths = [resourcesBundle pathsForResourcesOfType:@"png"
                                                   inDirectory:@"images"];
      
      [PNGPaths
       enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
         NSLog(@"Path %lu = %@", (unsigned long)idx+1, obj);
       }];
      
    } else {
      NSLog(@"Failed to load the bundle.");
    }
    
  } else {
    NSLog(@"Could not find the bundle.");
  }
  
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
