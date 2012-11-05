//
//  AppDelegate.m
//  Saving Objects to Files
//
//  Created by Vandad Nahavandipoor on 13/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

    /* Define the name and the last name we are going to set in the object */
    NSString *const kFirstName = @"Steven";
    NSString *const kLastName = @"Jobs";
    
    /* Determine where we want to archive the object */
    NSString *filePath = [NSTemporaryDirectory()
                          stringByAppendingPathComponent:@"steveJobs.txt"];
    
    /* Instantiate the object */
    Person *steveJobs = [[Person alloc] init];
    steveJobs.firstName = kFirstName;
    steveJobs.lastName = kLastName;
    
    /* Archive the object to the file */
    [NSKeyedArchiver archiveRootObject:steveJobs toFile:filePath];
    
    /* Now unarchive the same class into another object */
    Person *cloneOfSteveJobs =
        [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    /* Check if the unarchived object has the same first name and last name
     as the previously-archived object */
    if ([cloneOfSteveJobs.firstName isEqualToString:kFirstName] &&
        [cloneOfSteveJobs.lastName isEqualToString:kLastName]){
        NSLog(@"Unarchiving worked");
    } else {
        NSLog(@"Could not read the same values back. Oh no!");
    }
    
    /* We no longer need the temp file, delete it */
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    [fileManager removeItemAtPath:filePath error:nil];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
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
