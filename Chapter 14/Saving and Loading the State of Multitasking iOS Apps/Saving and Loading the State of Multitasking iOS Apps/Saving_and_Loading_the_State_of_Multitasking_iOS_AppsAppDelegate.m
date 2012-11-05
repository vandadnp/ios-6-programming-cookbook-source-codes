//
//  Saving_and_Loading_the_State_of_Multitasking_iOS_AppsAppDelegate.m
//  Saving and Loading the State of Multitasking iOS Apps
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Saving_and_Loading_the_State_of_Multitasking_iOS_AppsAppDelegate.h"

@implementation 
  Saving_and_Loading_the_State_of_Multitasking_iOS_AppsAppDelegate

- (void) saveUserScore{
  /* Save the user score here */
}

- (void) saveLevelToDisk{
  /* Save the current level and the user's location on map to disk */
}

- (void) pauseGameEngine{
  /* Pause the game engine here */
}

- (void) loadUserScore{
  /* Load the user's location back to memory */
}

- (void) loadLevelFromDisk{
  /* Load the user's previous location on the map */
}

- (void) resumeGameEngine{
  /* Resume the game engine here */
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application{
  [self pauseGameEngine];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
  [self resumeGameEngine];
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
  [self saveUserScore];
  [self saveLevelToDisk];
  [self pauseGameEngine];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
  [self loadUserScore];
  [self loadLevelFromDisk];
  [self resumeGameEngine];
}

@end
