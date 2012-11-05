//
//  AppDelegate.m
//  Creating and Managing Folders for Apps in iCloud
//
//  Created by Vandad Nahavandipoor on 21/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  NSFileManager *fileManager = [[NSFileManager alloc] init];
//  
//  #error Replace this with your own Team ID
//  NSString *teamID = @"TEAM ID";
//  
//  NSString *rootFolderIdentifier = [NSString stringWithFormat:
//    @"%@.com.pixolity.Creating-and-Managing-Folders-for-Apps-in-iCloud",
//                                    teamID];
//  
//  NSURL *containerURL = 
//    [fileManager URLForUbiquityContainerIdentifier:rootFolderIdentifier];
//  
//  NSString *documentsDirectory = [[containerURL path] 
//                                  stringByAppendingPathComponent:@"Documents"];
//  BOOL isDirectory = NO;
//  BOOL mustCreateDocumentsDirectory = NO;
//  
//  if ([fileManager fileExistsAtPath:documentsDirectory
//                        isDirectory:&isDirectory]){
//    if (isDirectory == NO){
//      mustCreateDocumentsDirectory = YES;
//    }
//  } else {
//    mustCreateDocumentsDirectory = YES;
//  }
//  
//  if (mustCreateDocumentsDirectory){
//    NSLog(@"Must create the directory.");
//    
//    NSError *directoryCreationError = nil;
//    
//    if ([fileManager createDirectoryAtPath:documentsDirectory
//               withIntermediateDirectories:YES
//                                attributes:nil
//                                     error:&directoryCreationError]){
//      NSLog(@"Successfully created the folder.");
//    } else {
//      NSLog(@"Failed to create the folder with error = %@", 
//            directoryCreationError);
//    }
//    
//  } else {
//    NSLog(@"This folder already exists.");
//  }
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

/* 2 */
//- (BOOL) createiCloudDirectory:(NSString *)paramDirectory
//             recursiveCreation:(BOOL)paramRecursiveCreation
//                   teamID:(NSString *)paramTeamID
//               iCloudContainer:(NSString *)paramContainer
//                     finalPath:(NSString **)paramFinalPath{
//  
//  BOOL result = NO;
//  
//  NSFileManager *fileManager = [[NSFileManager alloc] init];
//  
//  NSString *rootFolderIdentifier = [NSString stringWithFormat:
//                                    @"%@.%@", paramTeamID, paramContainer];
//  
//  NSURL *containerURL = 
//    [fileManager URLForUbiquityContainerIdentifier:rootFolderIdentifier];
//  
//  NSString *documentsDirectory = [[containerURL path] 
//                                  stringByAppendingPathComponent:@"Documents"];
//  
//  if (paramFinalPath != nil){
//    *paramFinalPath = documentsDirectory;
//  }
//  
//  BOOL isDirectory = NO;
//  BOOL mustCreateDocumentsDirectory = NO;
//  
//  if ([fileManager fileExistsAtPath:documentsDirectory
//                        isDirectory:&isDirectory]){
//    if (isDirectory == NO){
//      mustCreateDocumentsDirectory = YES;
//    }
//  } else {
//    mustCreateDocumentsDirectory = YES;
//  }
//  
//  if (mustCreateDocumentsDirectory){
//    NSLog(@"Must create the directory.");
//    
//    NSError *directoryCreationError = nil;
//    
//    if ([fileManager createDirectoryAtPath:documentsDirectory
//               withIntermediateDirectories:paramRecursiveCreation
//                                attributes:nil
//                                     error:&directoryCreationError]){
//      result = YES;
//      NSLog(@"Successfully created the folder.");
//    } else {
//      NSLog(@"Failed to create the folder with error = %@", 
//            directoryCreationError);
//    }
//    
//  } else {
//    NSLog(@"This folder already exists.");
//    result = YES;
//  }
//  
//  return result;
//  
//}
//
//- (BOOL)            application:(UIApplication *)application
//didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  
//  #error Replace this with your own Team ID
//  NSString *teamID = @"TEAM ID";
//  
//  NSString *containerID = 
//  @"com.pixolity.Creating-and-Managing-Folders-for-Apps-in-iCloud";
//  
//  NSString *documentsDirectory = nil;
//  
//  if ([self createiCloudDirectory:@"Documents"
//                recursiveCreation:YES 
//                           teamID:teamID
//                  iCloudContainer:containerID
//                        finalPath:&documentsDirectory]){
//    NSLog(@"Successfully created the directory in %@", documentsDirectory);
//  } else {
//    NSLog(@"Failed to create the directory.");
//  }
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}


/* 3 */
- (BOOL) createiCloudDirectory:(NSString *)paramDirectory
             recursiveCreation:(BOOL)paramRecursiveCreation
                        teamID:(NSString *)paramTeamID
               iCloudContainer:(NSString *)paramContainer
                     finalPath:(NSString **)paramFinalPath{
  
  BOOL result = NO;
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  
  NSString *rootFolderIdentifier = [NSString stringWithFormat:
                                    @"%@.%@", paramTeamID, paramContainer];
  
  NSURL *containerURL = 
  [fileManager URLForUbiquityContainerIdentifier:rootFolderIdentifier];
  
  NSString *documentsDirectory = [[containerURL path] 
                                  stringByAppendingPathComponent:@"Documents"];
  
  if (paramFinalPath != nil){
    *paramFinalPath = documentsDirectory;
  }
  
  BOOL isDirectory = NO;
  BOOL mustCreateDocumentsDirectory = NO;
  
  if ([fileManager fileExistsAtPath:documentsDirectory
                        isDirectory:&isDirectory]){
    if (isDirectory == NO){
      mustCreateDocumentsDirectory = YES;
    }
  } else {
    mustCreateDocumentsDirectory = YES;
  }
  
  if (mustCreateDocumentsDirectory){
    NSLog(@"Must create the directory.");
    
    NSError *directoryCreationError = nil;
    
    if ([fileManager createDirectoryAtPath:documentsDirectory
               withIntermediateDirectories:paramRecursiveCreation
                                attributes:nil
                                     error:&directoryCreationError]){
      result = YES;
      NSLog(@"Successfully created the folder.");
    } else {
      NSLog(@"Failed to create the folder with error = %@", 
            directoryCreationError);
    }
    
  } else {
    NSLog(@"This folder already exists.");
    result = YES;
  }
  
  return result;
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  #error Replace this with your own Team ID
  NSString *teamID = @"TEAM ID";
  
  NSString *containerID = 
    @"com.pixolity.Creating-and-Managing-Folders-for-Apps-in-iCloud";
  
  NSString *documentsDirectory = nil;
  
  if ([self createiCloudDirectory:@"Documents"
            recursiveCreation:YES 
                       teamID:teamID
                  iCloudContainer:containerID
                        finalPath:&documentsDirectory]){
    NSLog(@"Successfully created the directory in %@", documentsDirectory);
    
    NSString *stringToSave = @"My String";
    
    NSString *pathToSave = [documentsDirectory 
                            stringByAppendingPathComponent:@"MyString.txt"];
    
    NSError *savingError = nil;
    
    if ([stringToSave writeToFile:pathToSave
                       atomically:YES
                         encoding:NSUTF8StringEncoding
                            error:&savingError]){
      NSLog(@"Successfully saved the string in iCloud.");
    } else {
      NSLog(@"Failed to save the string with error = %@", savingError);
    }
    
    
  } else {
    NSLog(@"Failed to create the directory.");
  }
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
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
