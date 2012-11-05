//
//  Handling_Interruptions_While_Recording_AudioViewController.m
//  Handling Interruptions While Recording Audio
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Handling_Interruptions_While_Recording_AudioViewController.h"

@implementation Handling_Interruptions_While_Recording_AudioViewController

- (NSString *) audioRecordingPath{
  
  NSString *result = nil;
  
  NSArray *folders = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
  NSString *documentsFolder = [folders objectAtIndex:0];
  
  result = [documentsFolder stringByAppendingPathComponent:@"Recording.m4a"];
  
  return result;
  
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player{
  
  /* The audio session has been deactivated here */
  
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player 
                         withFlags:(NSUInteger)flags{
  
  if (flags == AVAudioSessionInterruptionFlags_ShouldResume){
    [player play];
  }
  
}

- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder{
  
  NSLog(@"Recording process is interrupted");
  
}

- (void)audioRecorderEndInterruption:(AVAudioRecorder *)recorder 
                           withFlags:(NSUInteger)flags{
  
  if (flags == AVAudioSessionInterruptionFlags_ShouldResume){
    NSLog(@"Resuming the recording...");
    [recorder record];
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
    /* This is not our player */
  }
  
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder 
                           successfully:(BOOL)flag{
  
  if (flag){
    
    NSLog(@"Successfully stopped the audio recording process.");
    
    /* Let's try to retrieve the data for the recorded file */
    NSError *playbackError = nil;
    
    NSError *dataReadingError = nil;
    NSData  *fileData = [NSData 
                         dataWithContentsOfFile:[self audioRecordingPath]
                         options:NSDataReadingMapped
                         error:&dataReadingError];
    
    /* Form an audio player and make it play the recorded data */
    self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                     error:&playbackError];
    
    /* Could we instantiate the audio player? */
    if (self.audioPlayer != nil){
      [self.audioPlayer setDelegate:self];
      
      /* Prepare to play and start playing */
      if ([self.audioPlayer prepareToPlay] &&
          [self.audioPlayer play]){
        NSLog(@"Successfully started playing the recorded audio.");
      } else {
        NSLog(@"Could not play the audio.");
      }
      
    } else {
      NSLog(@"Failed to create an audio player.");
    }
    
  } else {
    NSLog(@"Stopping the audio recording failed.");
  }
  
  /* Here we don't need the audio recorder anymore */
  if ([recorder isEqual:self.audioRecorder]){
    self.audioRecorder = nil;
  } else {
    /* This is not our recorder */
  }
  
}

- (void) stopRecordingOnAudioRecorder:(AVAudioRecorder *)paramRecorder{  
  /* Just stop the audio recorder here */
  [paramRecorder stop];
}

- (NSDictionary *) audioRecordingSettings{
  
  NSDictionary *result = nil;
  
  /* Let's prepare the audio recorder options in the 
   dictionary. Later we will use this dictionary to instantiate an
   audio recorder of type AVAudioRecorder */
  
  NSMutableDictionary *Settings =  [[NSMutableDictionary alloc] init];
  
  [Settings setValue:[NSNumber numberWithInteger:kAudioFormatAppleLossless]
              forKey:AVFormatIDKey];
  
  [Settings setValue:[NSNumber numberWithFloat:44100.0f]
              forKey:AVSampleRateKey];
  
  [Settings setValue:[NSNumber numberWithInteger:1]
              forKey:AVNumberOfChannelsKey];
  
  [Settings setValue:[NSNumber numberWithInteger:AVAudioQualityLow]
              forKey:AVEncoderAudioQualityKey];
  
  result = [NSDictionary dictionaryWithDictionary:Settings];
  
  return result;
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSError   *error = nil;
  
  NSString *pathAsString = [self audioRecordingPath];
  
  NSURL *audioRecordingURL = [NSURL fileURLWithPath:pathAsString];
    
  self.audioRecorder = [[AVAudioRecorder alloc] 
                        initWithURL:audioRecordingURL
                        settings:[self audioRecordingSettings]
                        error:&error];
  
  if (self.audioRecorder != nil){
    
    [self.audioRecorder setDelegate:self];
    /* Prepare the recorder and then start the recording */
    
    if ([self.audioRecorder prepareToRecord] &&
        [self.audioRecorder record]){
      NSLog(@"Successfully started to record.");
      
      /* After 20 seconds, let's stop the recording process */
      [self performSelector:@selector(stopRecordingOnAudioRecorder:)
                 withObject:self.audioRecorder
                 afterDelay:20.0f];
      
    } else {
      NSLog(@"Failed to record.");
      self.audioRecorder = nil;
    }
    
  } else {
    NSLog(@"Failed to create an instance of the audio recorder.");
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
