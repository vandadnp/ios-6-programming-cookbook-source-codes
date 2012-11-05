//
//  Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate.m
//  Completing a Long-Running Task in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate.h"

@implementation Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void) endBackgroundTask{
  
  dispatch_queue_t mainQueue = dispatch_get_main_queue();
  
  __weak Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate
    *weakSelf = self;
  
  dispatch_async(mainQueue, ^(void) {
    
    Completing_a_Long_Running_Task_in_the_BackgroundAppDelegate
      *strongSelf = weakSelf;
    
    if (strongSelf != nil){
      [strongSelf.myTimer invalidate];
      [[UIApplication sharedApplication]
       endBackgroundTask:self.backgroundTaskIdentifier];      
      strongSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    }
    
  });
  
}

- (BOOL) isMultitaskingSupported{
  
  BOOL result = NO;
  if ([[UIDevice currentDevice] 
       respondsToSelector:@selector(isMultitaskingSupported)]){
    result = [[UIDevice currentDevice] isMultitaskingSupported];
  }
  return result;
  
}

- (void) timerMethod:(NSTimer *)paramSender{
  
  NSTimeInterval backgroundTimeRemaining = 
    [[UIApplication sharedApplication] backgroundTimeRemaining];
  
  if (backgroundTimeRemaining == DBL_MAX){
    NSLog(@"Background Time Remaining = Undetermined");
  } else {
    NSLog(@"Background Time Remaining = %.02f Seconds", 
          backgroundTimeRemaining);
  }
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
  
  if ([self isMultitaskingSupported] == NO){
    return;
  }
  
  self.myTimer = 
  [NSTimer scheduledTimerWithTimeInterval:1.0f
                                   target:self
                                 selector:@selector(timerMethod:)
                                 userInfo:nil
                                  repeats:YES];

  self.backgroundTaskIdentifier = 
  [application beginBackgroundTaskWithExpirationHandler:^(void) {
    [self endBackgroundTask];
  }];
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
  
  if (self.backgroundTaskIdentifier != UIBackgroundTaskInvalid){
    [self endBackgroundTask];
  }
  
}

@end
