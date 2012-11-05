//
//  Responding_to_Changes_in_App_SettingsAppDelegate.m
//  Responding to Changes in App Settings
//
//  Created by Vandad Nahavandipoor on 21/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Responding_to_Changes_in_App_SettingsAppDelegate.h"

@implementation Responding_to_Changes_in_App_SettingsAppDelegate

- (void) settingsChanged:(NSNotification *)paramNotification{
  
  NSLog(@"Settings changed");
  NSLog(@"Notification Object = %@", [paramNotification object]);
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(settingsChanged:)
   name:NSUserDefaultsDidChangeNotification
   object:nil];
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
