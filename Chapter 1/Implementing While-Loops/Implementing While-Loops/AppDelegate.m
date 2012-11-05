//
//  AppDelegate.m
//  Implementing While-Loops
//
//  Created by Vandad Nahavandipoor on 21/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

NSUInteger lengthOfCString(const char *paramString);

@implementation AppDelegate

@synthesize window = _window;

NSUInteger lengthOfCString(const char *paramString){
  
  NSUInteger result = 0;
  
  if (paramString == NULL){
    return 0;
  }
  
  char *stringPointer = (char *)paramString;
  
  while (*stringPointer != 0x00){
    result++;
    stringPointer++;
  }
  
  return result;
  
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  /* 1 */
//  NSUInteger counter = 0;
//  while (counter < 10){
//    NSLog(@"Counter = %lu", (unsigned long)counter);
//    counter++;
//  }
  
  /* 2 */
//  BOOL shouldExitLoop = NO;
//  NSUInteger counter = 0;
//  
//  while (shouldExitLoop == NO){
//    counter++;
//    if (counter >= 10){
//      shouldExitLoop = YES;
//    }
//  }
//  
//  NSLog(@"Counter = %lu", (unsigned long)counter);
  
  /* 3 */
//  while (YES){
//    /* Infinite loop */
//  }
  
  /* 4 */
//  char *myString = "Some Random String";
//  NSUInteger counter = 0;
//  char character;
//  while ((character = myString[counter++]) != 'R' &&
//         counter < strlen(myString)){
//    /* Empty */
//  }
//  NSLog(@"Found the letter R at character #%lu", (unsigned long)counter+1);
  
  /* 5 */
//  char *cString = "My String";
//  char *stringPointer = cString;
//  while (*stringPointer != 0x00){
//    NSLog(@"%c", *stringPointer);
//    stringPointer++;
//  }
  
  //NSLog(@"%lu", (unsigned long)lengthOfCString("O'Reilly"));
  
  for (;;){ NSLog(@"Bla"); }
  
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
