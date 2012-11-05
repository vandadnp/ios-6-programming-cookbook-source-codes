//
//  Handling_Interruptions_While_Playing_AudioViewController.m
//  Handling Interruptions While Playing Audio
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Handling_Interruptions_While_Playing_AudioViewController.h"

@implementation Handling_Interruptions_While_Playing_AudioViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
  
  /* Audio Session is interrupted. The player will be paused here */
  
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player 
                         withFlags:(NSUInteger)flags{
  
  if (flags == AVAudioSessionInterruptionFlags_ShouldResume &&
      player != nil){
    [player play];
  }
  
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player 
                       successfully:(BOOL)flag{
  
  NSLog(@"Finished playing the song");
  
  /* The [flag] parameter tells us if the playback was successfully
   finished or not */
  
  if ([player isEqual:self.audioPlayer]){
    self.audioPlayer = nil;
  } else {
    /* This is not our audio player! */
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  dispatch_queue_t dispatchQueue = 
  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  dispatch_async(dispatchQueue, ^(void) {
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
      if ([self.audioPlayer prepareToPlay]&&
          [self.audioPlayer play]){
        /* Successfully started playing */
      } else {
        /* Failed to play */
      }
    } else {
      /* Failed to instantiate AVAudioPlayer */
    }
  });
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
