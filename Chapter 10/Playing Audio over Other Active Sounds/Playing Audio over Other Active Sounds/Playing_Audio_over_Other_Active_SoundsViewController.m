//
//  Playing_Audio_over_Other_Active_SoundsViewController.m
//  Playing Audio over Other Active Sounds
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Playing_Audio_over_Other_Active_SoundsViewController.h"

@implementation Playing_Audio_over_Other_Active_SoundsViewController

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
  /* The audio session has been deactivated here */
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player 
                         withFlags:(NSUInteger)flags{
  if (flags == AVAudioSessionInterruptionFlags_ShouldResume){
    [player play];
  }  
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player 
                       successfully:(BOOL)flag{
  
  if (flag){
    NSLog(@"Audio player stopped correctly.");
  } else {
    NSLog(@"Audio player did not stop correctly.");
  }
  
  if ([player isEqual:self.audioPlayer]){
    self.audioPlayer = nil;
  } else {
    /* This is not our audio player */
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSError *audioSessionError = nil;
  AVAudioSession *audioSession = [AVAudioSession sharedInstance];
  if ([audioSession setCategory:AVAudioSessionCategoryAmbient
                          error:&audioSessionError]){
    NSLog(@"Successfully set the audio session.");
  } else {
    NSLog(@"Could not set the audio session");
  }
  
  dispatch_queue_t dispatchQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
    NSBundle *mainBundle = [NSBundle mainBundle];
    
    NSString *filePath = [mainBundle pathForResource:@"MySong"
                                              ofType:@"mp3"];
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    NSError *audioPlayerError = nil;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData 
                                                     error:&audioPlayerError];
    
    if (self.audioPlayer != nil){
      
      self.audioPlayer.delegate = self;
      
      if ([self.audioPlayer prepareToPlay] &&
          [self.audioPlayer play]){
        NSLog(@"Successfully started playing.");
        
      } else {
        NSLog(@"Failed to play the audio file.");
        self.audioPlayer = nil;
      }
      
    } else {
      NSLog(@"Could not instantiate the audio player.");
    }
  });

}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
