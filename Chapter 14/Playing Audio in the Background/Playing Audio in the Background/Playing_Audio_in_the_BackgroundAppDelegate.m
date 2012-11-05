//
//  Playing_Audio_in_the_BackgroundAppDelegate.m
//  Playing Audio in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Playing_Audio_in_the_BackgroundAppDelegate.h"

@implementation Playing_Audio_in_the_BackgroundAppDelegate

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
  
  /* Audio Session is interrupted.
   The player will be paused here */
  
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
                         withFlags:(NSUInteger)flags{
  
  /* Check the flags, if we can resume the audio,
   then we should do it here */
  
  if (flags == AVAudioSessionInterruptionFlags_ShouldResume){
    [player play];
  }
  
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag{
  
  NSLog(@"Finished playing the song");
  
  /* The flag parameter tells us if the playback was successfully
   finished or not */
  
  if ([player isEqual:self.audioPlayer]){
    self.audioPlayer = nil;
  } else {
    /* This isn't our audio player! */
  }
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_queue_t dispatchQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
    NSError *audioSessionError = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if ([audioSession setCategory:AVAudioSessionCategoryPlayback
                            error:&audioSessionError]){
      NSLog(@"Successfully set the audio session.");
    } else {
      NSLog(@"Could not set the audio session");
    }
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"MySong"
                                              ofType:@"mp3"];
    
    NSData   *fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSError  *error = nil;
    
    /* Start the audio player */  
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                     error:&error];
    
    /* Did we get an instance of AVAudioPlayer? */
    if (self.audioPlayer != nil){
      /* Set the delegate and start playing */
      
      self.audioPlayer.delegate = self;
      
      if ([self.audioPlayer prepareToPlay] &&
          [self.audioPlayer play]){
        NSLog(@"Successfully started playing...");
      } else {
        NSLog(@"Failed to play.");
      }
      
    } else {
      /* Failed to instantiate AVAudioPlayer */
    }
  });
  
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
