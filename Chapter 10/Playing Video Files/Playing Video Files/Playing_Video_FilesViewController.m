//
//  Playing_Video_FilesViewController.m
//  Playing Video Files
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Playing_Video_FilesViewController.h"

@interface Playing_Video_FilesViewController(Private)
  - (void) startPlayingVideo:(id)paramSender;
  - (void) stopPlayingVideo:(id)paramSender;
@end

@implementation Playing_Video_FilesViewController

/* -------------------------- */

//- (IBAction) startPlayingVideo:(id)paramSender{
//  
//  NSBundle *mainBundle = [NSBundle mainBundle];
//  
//  NSString *urlAsString = [mainBundle pathForResource:@"Sample"
//                                               ofType:@"m4v"];
//  
//  NSURL    *url = [NSURL fileURLWithPath:urlAsString];
//  
//  MPMoviePlayerController *newMoviePlayer = 
//  [[MPMoviePlayerController alloc] initWithContentURL:url];
//
//  self.moviePlayer = newMoviePlayer;
//
//  [newMoviePlayer release];
//  
//  if (self.moviePlayer != nil){
//    
//    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
//    
//    UIView *playerView = self.moviePlayer.view;
//
//    CGRect halfRect = self.view.frame;
//    halfRect.size.width /= 2.0f;
//    halfRect.size.height /= 2.0f;
//    
//    playerView.frame = halfRect;
//    playerView.center = self.view.center;
//    
//    [self.view addSubview:playerView];
//    
//    NSLog(@"Successfully instantiated the movie player.");
//    
//    //[self.moviePlayer play];
//
//  } else {
//    NSLog(@"Failed to instantiate the movie player.");
//  }
//  
//}

/* -------------------------- */

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
    
    NSLog(@"Successfully instantiated the movie player.");
    
    /* Scale the movie player to fit the aspect ratio */
    self.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    /* Let's start playing the video in full screen mode */
    [self.moviePlayer play];
        
    [self.view addSubview:self.moviePlayer.view];
    
    [self.moviePlayer setFullscreen:YES
                           animated:YES];
    
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
