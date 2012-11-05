//
//  Creating_TimersAppDelegate.m
//  Creating Timers
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Creating_TimersAppDelegate.h"

@implementation Creating_TimersAppDelegate

/* 1 */
//- (void) paint:(NSTimer *)paramTimer{
//  /* Do something here */
//  NSLog(@"Painting");
//}
//
//- (void) startPainting{
//  
//  self.paintingTimer = [NSTimer 
//                        scheduledTimerWithTimeInterval:1.0
//                        target:self
//                        selector:@selector(paint:) 
//                        userInfo:nil
//                        repeats:YES];
//  
//}
//
//- (void) stopPainting{
//  if (self.paintingTimer != nil){
//    [self.paintingTimer invalidate];    
//  }
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application{
//  [self stopPainting];
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application{
//  [self startPainting];
//}

/* 2 */
//- (void) paint:(NSTimer *)paramTimer{
//  /* Do something here */
//  NSLog(@"Painting");
//}
//
//- (void) startPainting{
//  
//  /* Here is the selector that we want to call */
//  SEL selectorToCall = @selector(paint:);
//  
//  /* Here we compose a method signature out of the selector. We
//   know that the selector is in the current class so it is easy
//   to construct the method signature */
//  NSMethodSignature *methodSignature = 
//    [[self class] instanceMethodSignatureForSelector:selectorToCall];
//  
//  /* Now base our invocation on the method signature. We need this
//   invocation to schedule a timer */
//  NSInvocation *invocation = 
//    [NSInvocation invocationWithMethodSignature:methodSignature];
//  [invocation setTarget:self];
//  [invocation setSelector:selectorToCall];
//  
//  /* Start a scheduled timer now */
//  self.paintingTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                                    invocation:invocation
//                                                       repeats:YES];
//  
//}
//
//- (void) stopPainting{
//  if (self.paintingTimer != nil){
//    [self.paintingTimer invalidate];    
//  }
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application{
//  [self stopPainting];
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application{
//  [self startPainting];
//}

/* 3 */
//- (void) paint:(NSTimer *)paramTimer{
//  /* Do something here */
//  NSLog(@"Painting");
//}
//
//- (void) startPainting{
//  
//  self.paintingTimer = [NSTimer timerWithTimeInterval:1.0
//                                               target:self
//                                             selector:@selector(paint:)
//                                             userInfo:nil
//                                              repeats:YES];
//  
//  /* Do your processing here and whenever you are ready,
//   use the addTimer:forMode instance method of the NSRunLoop class
//   in order to schedule the timer on that run loop */
//  
//  [[NSRunLoop currentRunLoop] addTimer:self.paintingTimer
//                               forMode:NSDefaultRunLoopMode];
//  
//}
//
//- (void) stopPainting{
//  if (self.paintingTimer != nil){
//    [self.paintingTimer invalidate];    
//  }
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application{
//  [self stopPainting];
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application{
//  [self startPainting];
//}

/* 4 */
- (void) paint:(NSTimer *)paramTimer{
  /* Do something here */
  NSLog(@"Painting");
}

- (void) startPainting{
  
  /* Here is the selector that we want to call */
  SEL selectorToCall = @selector(paint:);
  
  /* Here we compose a method signature out of the selector. We
   know that the selector is in the current class so it is easy
   to construct the method signature */
  NSMethodSignature *methodSignature = 
  [[self class] instanceMethodSignatureForSelector:selectorToCall];
  
  /* Now base our invocation on the method signature. We need this
   invocation to schedule a timer */
  NSInvocation *invocation = 
  [NSInvocation invocationWithMethodSignature:methodSignature];  
  
  [invocation setTarget:self];
  [invocation setSelector:selectorToCall];
  
  self.paintingTimer = [NSTimer timerWithTimeInterval:1.0
                                           invocation:invocation 
                                              repeats:YES];;
  
  /* Do your processing here and whenever you are ready,
   use the addTimer:forMode instance method of the NSRunLoop class
   in order to schedule the timer on that run loop */
  
  [[NSRunLoop currentRunLoop] addTimer:self.paintingTimer
                               forMode:NSDefaultRunLoopMode];
  
}

- (void) stopPainting{
  if (self.paintingTimer != nil){
    [self.paintingTimer invalidate];    
  }
}

- (void)applicationWillResignActive:(UIApplication *)application{
  [self stopPainting];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
  [self startPainting];
}


- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
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

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
