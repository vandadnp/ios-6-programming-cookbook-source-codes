//
//  Detecting_and_Probing_the_CameraAppDelegate.m
//  Detecting and Probing the Camera
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_and_Probing_the_CameraAppDelegate.h"

@implementation Detecting_and_Probing_the_CameraAppDelegate

- (BOOL) isCameraAvailable{
  
  return [UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera];
  
}

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  if ([self isCameraAvailable]){
//    NSLog(@"Camera is available.");
//  } else {
//    NSLog(@"Camera is not available.");
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
- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
                  sourceType:(UIImagePickerControllerSourceType)paramSourceType{
  
  __block BOOL result = NO;
  
  if ([paramMediaType length] == 0){
    NSLog(@"Media type is empty.");
    return NO;
  }
  
  NSArray *availableMediaTypes = 
  [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
  
  [availableMediaTypes enumerateObjectsUsingBlock:
   ^(id obj, NSUInteger idx, BOOL *stop) {
     
     NSString *mediaType = (NSString *)obj;
     if ([mediaType isEqualToString:paramMediaType]){
       result = YES;
       *stop= YES;
     }
     
   }];
  
  return result;
  
}

- (BOOL) doesCameraSupportShootingVideos{
  
  return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
                        sourceType:UIImagePickerControllerSourceTypeCamera];
  
}

- (BOOL) doesCameraSupportTakingPhotos{
  
  return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
                        sourceType:UIImagePickerControllerSourceTypeCamera];
  
}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  if ([self doesCameraSupportTakingPhotos]){
//    NSLog(@"The camera supports taking photos.");
//  } else {
//    NSLog(@"The camera does not support taking photos");
//  }
//  
//  if ([self doesCameraSupportShootingVideos]){
//    NSLog(@"The camera supports shooting videos.");
//  } else {
//    NSLog(@"The camera does not support shooting videos.");
//  }
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

- (BOOL) isFrontCameraAvailable{
  
  return [UIImagePickerController 
          isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
  
}

- (BOOL) isRearCameraAvailable{
  
  return [UIImagePickerController 
          isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
  
}

- (BOOL) isFlashAvailableOnFrontCamera{
  
  return [UIImagePickerController isFlashAvailableForCameraDevice:
          UIImagePickerControllerCameraDeviceFront];
  
}

- (BOOL) isFlashAvailableOnRearCamera{
  
  return [UIImagePickerController isFlashAvailableForCameraDevice:
          UIImagePickerControllerCameraDeviceRear];
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  if ([self isFrontCameraAvailable]){
    NSLog(@"The front camera is available.");
    if ([self isFlashAvailableOnFrontCamera]){
      NSLog(@"The front camera is equipped with a flash");
    } else {
      NSLog(@"The front camera is not equipped with a flash");
    }
  } else {
    NSLog(@"The front camera is not available.");
  }
  
  if ([self isRearCameraAvailable]){
    NSLog(@"The rear camera is available.");
    if ([self isFlashAvailableOnRearCamera]){
      NSLog(@"The rear camera is equipped with a flash");
    } else {
      NSLog(@"The rear camera is not equipped with a flash");
    }
  } else {
    NSLog(@"The rear camera is not available.");
  }
  
  if ([self doesCameraSupportTakingPhotos]){
    NSLog(@"The camera supports taking photos.");
  } else {
    NSLog(@"The camera does not support taking photos");
  }
  
  if ([self doesCameraSupportShootingVideos]){
    NSLog(@"The camera supports shooting videos.");
  } else {
    NSLog(@"The camera does not support shooting videos.");
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
