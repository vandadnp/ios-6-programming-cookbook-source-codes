//
//  Retrieving_Gyroscope_DataAppDelegate.m
//  Retrieving Gyroscope Data
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Retrieving_Gyroscope_DataAppDelegate.h"

@implementation Retrieving_Gyroscope_DataAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  CMMotionManager *manager = [[CMMotionManager alloc] init];
  
  if ([manager isGyroAvailable]){
    
    if ([manager isGyroActive] == NO){
      
      [manager setGyroUpdateInterval:1.0f / 40.0f];
      
      NSOperationQueue *queue = [[NSOperationQueue alloc] init];
      
      [manager 
       startGyroUpdatesToQueue:queue
       withHandler:^(CMGyroData *gyroData, NSError *error) {
         
         NSLog(@"Gyro Rotation x = %.04f", gyroData.rotationRate.x);
         NSLog(@"Gyro Rotation y = %.04f", gyroData.rotationRate.y);
         NSLog(@"Gyro Rotation z = %.04f", gyroData.rotationRate.z);
         
       }];
    } else {
      NSLog(@"Gyro is already active.");
    }
    
  } else {
    NSLog(@"Gyro isn't available.");
  }
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
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
