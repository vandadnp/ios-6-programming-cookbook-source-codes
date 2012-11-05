//
//  AppDelegate.m
//  Writing to and Reading from Files
//
//  Created by Vandad Nahavandipoor on 11/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSString *filePath = [NSTemporaryDirectory()
                          stringByAppendingPathComponent:@"MyFile.txt"];
    
    
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

/* 5 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSString *filePath = [NSTemporaryDirectory()
//                          stringByAppendingPathComponent:@"MyFile.txt"];
//    
//    char bytes[4] = {'a', 'b', 'c', 'd'};
//    
//    NSData *dataFromBytes = [[NSData alloc] initWithBytes:bytes
//                                                   length:sizeof(bytes)];
//    
//    if ([dataFromBytes writeToFile:filePath atomically:YES]){
//        NSData *readData = [[NSData alloc] initWithContentsOfFile:filePath];
//        if ([readData isEqualToData:dataFromBytes]){
//            NSLog(@"The data read is the same data as was written to disk.");
//        } else {
//            NSLog(@"Failed to read the data from disk.");
//        }
//    } else {
//        NSLog(@"Failed to save the data to disk.");
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}


/* 4 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSString *filePath = [NSTemporaryDirectory()
//                          stringByAppendingPathComponent:@"MyFile.txt"];
//    
//    NSDictionary *dict = @{
//    @"first name" : @"Steven",
//    @"middle name" : @"Paul",
//    @"last name" : @"Jobs",
//    };
//    
//    if ([dict writeToFile:filePath atomically:YES]){
//        NSDictionary *readDictionary = [[NSDictionary alloc]
//                                        initWithContentsOfFile:filePath];
//        
//        /* Now compare the dictionaries and see if the one we read from disk
//         is the same as the one we saved to disk */
//        if ([readDictionary isEqualToDictionary:dict]){
//            NSLog(@"The file we read is the same one as the one we saved.");
//        } else {
//            NSLog(@"Failed to read the dictionary from disk.");
//        }
//        
//    } else {
//        NSLog(@"Failed to write the dictionary to disk.");
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

/* 3 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSString *filePath = [NSTemporaryDirectory()
//                      stringByAppendingPathComponent:@"MyFile.txt"];
//
//NSArray *arrayOfNames = @[@"Steve", @"John", @"Edward"];
//if ([arrayOfNames writeToFile:filePath atomically:YES]){
//    
//    NSArray *readArray = [[NSArray alloc] initWithContentsOfFile:filePath];
//    if ([readArray count] == [arrayOfNames count]){
//        NSLog(@"Read the array back from disk just fine.");
//    } else {
//        NSLog(@"Failed to read the array back from disk.");
//    }
//} else {
//    NSLog(@"Failed to save the array to disk.");
//}
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

/* 2 */
//- (BOOL) writeText:(NSString *)paramText toPath:(NSString *)paramPath{
//    return [paramText writeToFile:paramPath
//                       atomically:YES
//                         encoding:NSUTF8StringEncoding
//                            error:nil];
//}
//
//- (NSString *) readTextFromPath:(NSString *)paramPath{
//    return [[NSString alloc] initWithContentsOfFile:paramPath
//                                           encoding:NSUTF8StringEncoding
//                                              error:nil];
//}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSString *filePath = [NSTemporaryDirectory()
//                          stringByAppendingPathComponent:@"MyFile.txt"];
//    
//    if ([self writeText:@"Hello, World!" toPath:filePath]){
//        
//        NSString *readText = [self readTextFromPath:filePath];
//        if ([readText length] > 0){
//            NSLog(@"Text read from disk = %@", readText);
//        } else {
//            NSLog(@"Failed to read the text from disk.");
//        }
//        
//    } else {
//        NSLog(@"Failed to write the file.");
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}


//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//
//    /* 1 */
//    NSString *someText = @"Random string that won't be backed up.";
//    NSString *destinationPath = [NSTemporaryDirectory()
//                                 stringByAppendingPathComponent:@"MyFile.txt"];
//    NSError *error = nil;
//    BOOL succeeded = [someText writeToFile:destinationPath
//                                atomically:YES
//                                  encoding:NSUTF8StringEncoding
//                                     error:&error];
//
//    if (succeeded) {
//        NSLog(@"Successfully stored the file at: %@", destinationPath);
//    } else {
//        NSLog(@"Failed to store the file. Error = %@", error);
//    }
//
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
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
