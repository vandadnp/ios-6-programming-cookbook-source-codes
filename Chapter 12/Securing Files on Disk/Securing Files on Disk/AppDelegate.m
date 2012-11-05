//
//  AppDelegate.m
//  Securing Files on Disk
//
//  Created by Vandad Nahavandipoor on 12/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/* 2 */

- (NSString *) cachesDirectory{
    
    NSArray *caches = [self.fileManager URLsForDirectory:NSCachesDirectory
                                               inDomains:NSUserDomainMask];
    if ([caches count] > 0){
        NSURL *result = caches[0];
        return [result path];
    } else {
        return nil;
    }
    
}

- (void) createFileIfDoesntExist:(NSString *)paramPath{
    
    NSDictionary *attributes = @{
    NSFileProtectionKey : NSFileProtectionComplete
    };
    
    if ([self.fileManager fileExistsAtPath:paramPath] == NO){
        [self.fileManager createFileAtPath:paramPath
                                  contents:nil
                                attributes:attributes];
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.fileManager = [[NSFileManager alloc] init];
    
    NSString *filePath = [[self cachesDirectory]
                          stringByAppendingPathComponent:@"file.txt"];
    
    [self createFileIfDoesntExist:filePath];
    
    self.fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) writeToFile{
    
    @try {
        NSLog(@"Attempting to write to the file...");
        [self.fileHandle writeData:
         [@"Hello World" dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"Successfully wrote to the file. Make sure you have a passcode\
              set on your device. This method should have failed!");
    }
    @catch (NSException *exception) {
        NSLog(@"Failed to write to file. Is it locked?");
    }
    @finally {
        NSLog(@"Finishing our background task...");
        [[UIApplication sharedApplication]
         endBackgroundTask:self.backgroundTask];
    }

    
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
    if (self.fileHandle == nil){
        NSLog(@"The file wasn't opened. No point trying to write to it!");
        return;
    }
    
    NSLog(@"Scheduling writing to file in 10 seconds...");
    self.backgroundTask = [[UIApplication sharedApplication]
                           beginBackgroundTaskWithExpirationHandler:^{
                               self.backgroundTask = UIBackgroundTaskInvalid;
                           }];
    
    [self performSelector:@selector(writeToFile)
               withObject:nil
               afterDelay:10.0f];
    
}

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSFileManager *fileManager = [[NSFileManager alloc] init];
//    
//    NSString *filePath = [NSTemporaryDirectory()
//                          stringByAppendingPathComponent:@"file.txt"];
//    
//    BOOL fileIsCreated = NO;
//    if ([fileManager fileExistsAtPath:filePath] == NO){
//        fileIsCreated = [fileManager createFileAtPath:filePath
//                                             contents:nil
//                                           attributes:nil];
//    }
//    
//    if (fileIsCreated == YES){
//        
//        /* Open the file handle */
//        NSFileHandle *fileHandle = [NSFileHandle
//                                    fileHandleForUpdatingAtPath:filePath];
//        
//        if (fileHandle != nil){
//            NSString *stringToWrite = @"Hello, World!";
//            
//            /* Write the data */
//            [fileHandle writeData:
//             [stringToWrite dataUsingEncoding:NSUTF8StringEncoding]];
//            
//            NSLog(@"Wrote to the file.");
//            
//        } else {
//            NSLog(@"Failed to create the file handle.");
//        }
//        
//        /* Close the file handle */
//        [fileHandle closeFile];
//        
//        /* Delete the file now that we no longer need it */
//        [fileManager removeItemAtPath:filePath error:nil];
//        
//    } else {
//        NSLog(@"Failed to create the file on disk.");
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

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
