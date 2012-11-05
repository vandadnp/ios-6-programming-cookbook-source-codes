//
//  Capturing_Thumbnails_from_a_Video_FileViewController.m
//  Capturing Thumbnails from a Video File
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Capturing_Thumbnails_from_a_Video_FileViewController.h"

@interface Capturing_Thumbnails_from_a_Video_FileViewController(Private)
- (void) startPlayingVideo:(id)paramSender;
- (void) stopPlayingVideo:(id)paramSender;
@end

@implementation Capturing_Thumbnails_from_a_Video_FileViewController

- (void) videoHasFinishedPlaying:(NSNotification *)paramNotification{
  
  /* Find out what the reason was for the player to stop */
  NSNumber *reason = 
  [paramNotification.userInfo
   valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
  
  if (reason != nil){
    NSInteger reasonAsInteger = [reason integerValue];
    
    switch (reasonAsInteger){
      case MPMovieFinishReasonPlaybackEnded:{
        /* The movie ended normally */
        break;
      }
      case MPMovieFinishReasonPlaybackError:{
        /* An error happened and the movie ended */
        break;
      }
      case MPMovieFinishReasonUserExited:{
        /* The user exited the player */
        break;
      }
    }
    
    NSLog(@"Finish Reason = %ld", (long)reasonAsInteger);
    [self stopPlayingVideo:nil];
  } /* if (reason != nil){ */
  
}

- (void) videoThumbnailIsAvailable:(NSNotification *)paramNotification{
  
  MPMoviePlayerController *controller = [paramNotification object];
  
  if (controller != nil &&
      [controller isEqual:self.moviePlayer]){
    NSLog(@"Thumbnail is available");
    
    /* Now get the thumbnail out of the user info dictionary */
    UIImage *thumbnail = 
    [paramNotification.userInfo 
     objectForKey:MPMoviePlayerThumbnailImageKey];
    
    if (thumbnail != nil){
      /* We got the thumbnail image. You can now use it here */
    }
  }
  
}

- (void) startPlayingVideo:(id)paramSender{
  
  /* First let's construct the URL of the file in our application bundle
   that needs to get played by the movie player */
  NSBundle *mainBundle = [NSBundle mainBundle];
  
  NSString *urlAsString = [mainBundle pathForResource:@"Sample"
                                               ofType:@"m4v"];
  
  NSURL    *url = [NSURL fileURLWithPath:urlAsString];
  
  /* If we have already created a movie player before,
   let's try to stop it */
  if (self.moviePlayer != nil){
    [self stopPlayingVideo:nil];
  }
  
  /* Now create a new movie player using the URL */
  self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
  
  if (self.moviePlayer != nil){
    
    /* Listen for the notification that the movie player sends us 
     whenever it finishes playing an audio file */
    [[NSNotificationCenter defaultCenter] 
     addObserver:self
     selector:@selector(videoHasFinishedPlaying:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:self.moviePlayer];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(videoThumbnailIsAvailable:)
     name:MPMoviePlayerThumbnailImageRequestDidFinishNotification
     object:self.moviePlayer];
    
    NSLog(@"Successfully instantiated the movie player.");
    
    /* Scale the movie player to fit the aspect ratio */
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    /* Let's start playing the video in full screen mode */
    [self.moviePlayer play];
    
    [self.view addSubview:self.moviePlayer.view];
    
    [self.moviePlayer setFullscreen:YES
                           animated:YES];
    
    /* Capture the frame at the third second into the movie */
    NSNumber *thirdSecondThumbnail = [NSNumber numberWithFloat:3.0f];
    
    /* We can ask to capture as many frames as we 
     want. But for now, we are just asking to capture one frame */
    NSArray  *requestedThumbnails = 
    [NSArray arrayWithObject:thirdSecondThumbnail];
    
    /* Ask the movie player to capture this frame for us */
    [self.moviePlayer 
     requestThumbnailImagesAtTimes:requestedThumbnails
     timeOption:MPMovieTimeOptionExact];
    
  } else {
    NSLog(@"Failed to instantiate the movie player.");
  }
  
}

- (void) stopPlayingVideo:(id)paramSender {
  
  if (self.moviePlayer != nil){
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:self.moviePlayer];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerThumbnailImageRequestDidFinishNotification
     object:self.moviePlayer];
    
    [self.moviePlayer stop];
    
    if ([self.moviePlayer.view.superview isEqual:self.view]){
      [self.moviePlayer.view removeFromSuperview];
    }
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.playButton.frame = CGRectMake(0.0f, 
                                     0.0f, 
                                     70.0f, 
                                     37.0f);
  self.playButton.center = self.view.center;
  
  self.playButton.autoresizingMask = 
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleRightMargin;
  
  [self.playButton addTarget:self
                      action:@selector(startPlayingVideo:)
            forControlEvents:UIControlEventTouchUpInside];
  [self.playButton setTitle:@"Play"
                   forState:UIControlStateNormal];
  [self.view addSubview:self.playButton];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end

