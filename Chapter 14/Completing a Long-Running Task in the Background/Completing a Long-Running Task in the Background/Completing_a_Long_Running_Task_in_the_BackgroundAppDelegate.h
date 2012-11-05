//
//  Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate.h
//  Completing a Long-Running Task in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, unsafe_unretained) 
  UIBackgroundTaskIdentifier backgroundTaskIdentifier;

@property (nonatomic, strong) NSTimer *myTimer;

@end
