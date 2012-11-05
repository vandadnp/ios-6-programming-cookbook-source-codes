//
//  Saving_and_Loading_the_State_of_Multitasking_iOS_AppsAppDelegate.h
//  Saving and Loading the State of Multitasking iOS Apps
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Saving_and_Loading_the_State_of_Multitasking_iOS_AppsAppDelegate 
           : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/* Saving the state of our app */
- (void) saveUserScore;
- (void) saveLevelToDisk;
- (void) pauseGameEngine;

/* Loading the state of our app */
- (void) loadUserScore;
- (void) loadLevelFromDisk;
- (void) resumeGameEngine;

@end
