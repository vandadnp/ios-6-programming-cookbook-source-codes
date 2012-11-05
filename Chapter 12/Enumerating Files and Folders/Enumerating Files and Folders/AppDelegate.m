//
//  AppDelegate.m
//  Enumerating Files and Folders
//
//  Created by Vandad Nahavandipoor on 11/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/* 2 */
- (NSArray *) contentsOfAppBundle{
    NSFileManager *manager = [[NSFileManager alloc] init];
    NSURL *bundleDir = [[NSBundle mainBundle] bundleURL];
    
    NSArray *propertiesToGet = @[
        NSURLIsDirectoryKey,
        NSURLIsReadableKey,
        NSURLCreationDateKey,
        NSURLContentAccessDateKey,
        NSURLContentModificationDateKey
    ];
    
    NSError *error = nil;
    NSArray *result = [manager contentsOfDirectoryAtURL:bundleDir
                                    includingPropertiesForKeys:propertiesToGet
                                                       options:0
                                                         error:&error];
    
    if (error != nil){
        NSLog(@"An error happened = %@", error);
    }
    
    return result;
}

- (NSString *) stringValueOfBOOLProperty:(NSString *)paramProperty
                               ofURL:(NSURL *)paramURL{
    
    NSNumber *boolValue = nil;
    NSError *error = nil;
    [paramURL getResourceValue:&boolValue
                        forKey:paramProperty
                         error:&error];
    if (error != nil){
        NSLog(@"Failed to get property of URL. Error = %@", error);
    }
    return [boolValue isEqualToNumber:@YES] ? @"Yes" : @"No";
    
}

- (NSString *) isURLDirectory:(NSURL *)paramURL{
    return [self stringValueOfBOOLProperty:NSURLIsDirectoryKey ofURL:paramURL];
}

- (NSString *) isURLReadable:(NSURL *)paramURL{
    return [self stringValueOfBOOLProperty:NSURLIsReadableKey ofURL:paramURL];
}

- (NSDate *) dateOfType:(NSString *)paramType inURL:(NSURL *)paramURL{
    NSDate *result = nil;
    NSError *error = nil;
    [paramURL getResourceValue:&result
                        forKey:paramType
                         error:&error];
    if (error != nil){
        NSLog(@"Failed to get property of URL. Error = %@", error);
    }
    return result;
}

- (void) printURLPropertiesToConsole:(NSURL *)paramURL{
    
    NSLog(@"Item name = %@", [paramURL lastPathComponent]);
    
    NSLog(@"Is a Directory? %@", [self isURLDirectory:paramURL]);
    
    NSLog(@"Is Readable? %@", [self isURLReadable:paramURL]);
    
    NSLog(@"Creation Date = %@",
          [self dateOfType:NSURLCreationDateKey inURL:paramURL]);
    
    NSLog(@"Access Date = %@",
          [self dateOfType:NSURLContentAccessDateKey inURL:paramURL]);
    
    NSLog(@"Modification Date = %@",
          [self dateOfType:NSURLContentModificationDateKey inURL:paramURL]);
    
    NSLog(@"-----------------------------------");
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    
    NSArray *itemsInAppBundle = [self contentsOfAppBundle];
    for (NSURL *item in itemsInAppBundle){
        [self printURLPropertiesToConsole:item];
    }
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSFileManager *fileManager = [[NSFileManager alloc] init];
//    NSString *bundleDir = [[NSBundle mainBundle] bundlePath];
//    
//    NSError *error = nil;
//    NSArray *bundleContents = [fileManager contentsOfDirectoryAtPath:bundleDir
//                                                               error:&error];
//    
//    if ([bundleContents count] > 0 &&
//        error == nil){
//        NSLog(@"Contents of the app bundle = %@", bundleContents);
//    }
//    else if ([bundleContents count] == 0 &&
//             error == nil){
//        NSLog(@"Call the police! The app bundle is empty.");
//    }
//    else {
//        NSLog(@"An error happened = %@", error);
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

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
