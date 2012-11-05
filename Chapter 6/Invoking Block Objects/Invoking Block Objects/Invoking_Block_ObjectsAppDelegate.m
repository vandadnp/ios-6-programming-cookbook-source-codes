//
//  Invoking_Block_ObjectsAppDelegate.m
//  Invoking Block Objects
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Invoking_Block_ObjectsAppDelegate.h"

@implementation Invoking_Block_ObjectsAppDelegate

//void (^simpleBlock)(NSString *) = ^(NSString  *paramString){
//  /* Implement the block object here and use the
//   paramString parameter */
//};
//
//- (void) callSimpleBlock{
//  
//  simpleBlock(@"O'Reilly");
//  
//}


NSString *(^trimString)(NSString *) = ^(NSString *inputString){
  
  NSString *result = [inputString stringByTrimmingCharactersInSet:
                      [NSCharacterSet whitespaceCharacterSet]];
  return result;
  
};

NSString *(^trimWithOtherBlock)(NSString *) = ^(NSString *inputString){
  return trimString(inputString);
};

- (void) callTrimBlock{
  
  NSString *trimmedString = trimWithOtherBlock(@"   O'Reilly    ");
  NSLog(@"Trimmed string = %@", trimmedString);
  
}

- (void) doCalculation{
  
  /* Do your calculation here */
  
}

- (void) calculationThreadEntry{
  
  @autoreleasepool {
    NSUInteger counter = 0;
    
    while ([[NSThread currentThread] isCancelled] == NO){
      
      [self doCalculation];
      
      counter++;
      
      if (counter >= 1000){
        break;
      }
      
    }
  }
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  /* Start the thread */
  [NSThread detachNewThreadSelector:@selector(calculationThreadEntry)
                           toTarget:self
                         withObject:nil];
  
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
