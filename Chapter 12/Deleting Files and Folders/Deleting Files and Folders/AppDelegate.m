//
//  AppDelegate.m
//  Deleting Files and Folders
//
//  Created by Vandad Nahavandipoor on 12/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/* Creates a folder at a given path */
- (void) createFolder:(NSString *)paramPath{
    NSError *error = nil;
    if ([self.fileManager createDirectoryAtPath:paramPath
                    withIntermediateDirectories:YES
                                     attributes:nil
                                          error:&error] == NO){
        NSLog(@"Failed to create folder %@. Error = %@",
              paramPath,
              error);
    }
}

/* Creates 5 .txt files in the given folder, named 1.txt, 2.txt, etc */
- (void) createFilesInFolder:(NSString *)paramPath{
    
    /* Create 10 files */
    for (NSUInteger counter = 0; counter < 5; counter++){
        NSString *fileName = [NSString stringWithFormat:@"%lu.txt",
                              (unsigned long)counter+1];
        NSString *path = [paramPath stringByAppendingPathComponent:fileName];
        NSString *fileContents = [NSString stringWithFormat:@"Some text"];
        NSError *error = nil;
        if ([fileContents writeToFile:path
                           atomically:YES
                             encoding:NSUTF8StringEncoding
                                error:&error] == NO){
            NSLog(@"Failed to save file to %@. Error = %@", path, error);
        }
    }
    
}

/* Enumerates all files/folders at a given path */
- (void) enumerateFilesInFolder:(NSString *)paramPath{
    
    NSError *error = nil;
    NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:paramPath
                                                              error:&error];
    
    if ([contents count] > 0 &&
        error == nil){
        NSLog(@"Contents of path %@ = \n%@", paramPath, contents);
    }
    else if ([contents count] == 0 &&
             error == nil){
        NSLog(@"Contents of path %@ is empty!", paramPath);
    }
    else {
        NSLog(@"Failed to enumerate path %@. Error = %@", paramPath, error);
    }
    
}

/* Deletes all files/folders in a given path */
- (void) deleteFilesInFolder:(NSString *)paramPath{
    
    NSError *error = nil;
    NSArray *contents = [self.fileManager contentsOfDirectoryAtPath:paramPath
                                                              error:&error];
    if (error == nil){
        error = nil;
        for (NSString *fileName in contents){
            /* We have the file name, to delete it, 
             we have to have the full path */
            NSString *filePath = [paramPath
                                  stringByAppendingPathComponent:fileName];
            if ([self.fileManager removeItemAtPath:filePath
                                             error:&error] == NO){
                NSLog(@"Failed to remove item at path %@. Error = %@",
                      fileName,
                      error);
            }
        }
    } else {
        NSLog(@"Failed to enumerate path %@. Error = %@", paramPath, error);
    }
    
}

/* Deletes a folder with a given path */
- (void) deleteFolder:(NSString *)paramPath{
    NSError *error = nil;
    if ([self.fileManager removeItemAtPath:paramPath error:&error] == NO){
        NSLog(@"Failed to remove path %@. Error = %@", paramPath, error);
    }
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    self.fileManager = [[NSFileManager alloc] init];
    
    NSString *txtFolder = [NSTemporaryDirectory()
                           stringByAppendingPathComponent:@"txt"];
    
    [self createFolder:txtFolder];
    [self createFilesInFolder:txtFolder];
    [self enumerateFilesInFolder:txtFolder];
    [self deleteFilesInFolder:txtFolder];
    [self enumerateFilesInFolder:txtFolder];
    [self deleteFolder:txtFolder];
    
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
