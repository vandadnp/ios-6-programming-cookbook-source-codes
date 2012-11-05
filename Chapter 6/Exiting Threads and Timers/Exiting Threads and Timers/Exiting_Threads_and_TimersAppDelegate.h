//
//  Exiting_Threads_and_TimersAppDelegate.h
//  Exiting Threads and Timers
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Exiting_Threads_and_TimersAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, strong) NSThread *myThread;

@end
