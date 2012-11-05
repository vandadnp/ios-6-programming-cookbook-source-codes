//
//  AppDelegate.m
//  Interacting with Passbook Programmatically
//
//  Created by Vandad Nahavandipoor on 05/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) PKPassLibrary *passLibrary;
@end

NSString *PassIdentifier        = @"pass.pixolity.testingpasskit";
NSString *PassSerialNumber      = @"p69f2J";

NSString *DepartureKey          = @"departure";
NSString *DeparturePlatformKey  = @"departurePlatform";
NSString *Arrival               = @"arrival";
NSString *ArrivalPlatform       = @"arrivalPlatform";

@implementation AppDelegate

- (void) displayPassInformation:(PKPass *)paramPass{
    
    if (paramPass == nil){
        NSLog(@"The given pass is nil.");
        return;
    }
    
    NSLog(@"Departs From = %@",
          [paramPass localizedValueForFieldKey:DepartureKey]);
    NSLog(@"Departure Platform = %@",
      [paramPass localizedValueForFieldKey:DeparturePlatformKey]);

    NSLog(@"Arrives at = %@",
      [paramPass localizedValueForFieldKey:Arrival]);
    NSLog(@"Arrival Platform = %@",
      [paramPass localizedValueForFieldKey:ArrivalPlatform]);
    
}

- (BOOL)                application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    if ([PKPassLibrary isPassLibraryAvailable]){
        self.passLibrary = [[PKPassLibrary alloc] init];
        
        PKPass *pass =
        [self.passLibrary passWithPassTypeIdentifier:PassIdentifier
                                        serialNumber:PassSerialNumber];
        [self displayPassInformation:pass];
        
    } else {
        /* Take another action here perhaps */
        NSLog(@"The pass library is not available.");
    }
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
