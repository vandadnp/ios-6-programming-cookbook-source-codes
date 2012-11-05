//
//  Accessing_the_Music_LibraryViewController.m
//  Accessing the Music Library
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "Accessing_the_Music_LibraryViewController.h"
//
//@implementation Accessing_the_Music_LibraryViewController
//
//
//- (void) mediaPicker:(MPMediaPickerController *)mediaPicker 
//   didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
//  
//  NSLog(@"Media Picker returned");
//  
//  for (MPMediaItem *thisItem in mediaItemCollection.items){
//    
//    NSURL     *itemURL = 
//    [thisItem valueForProperty:MPMediaItemPropertyAssetURL];
//    
//    NSString  *itemTitle = 
//    [thisItem valueForProperty:MPMediaItemPropertyTitle];
//    
//    NSString  *itemArtist = 
//    [thisItem valueForProperty:MPMediaItemPropertyArtist];
//    
//    MPMediaItemArtwork *itemArtwork = 
//    [thisItem valueForProperty:MPMediaItemPropertyArtwork];
//    
//    NSLog(@"Item URL = %@", itemURL);
//    NSLog(@"Item Title = %@", itemTitle);
//    NSLog(@"Item Artist = %@", itemArtist);
//    NSLog(@"Item Artwork = %@", itemArtwork);
//  }
//  
//  [mediaPicker dismissModalViewControllerAnimated:YES];
//  
//}
//
//- (void) mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
//  /* The media picker was cancelled */
//  NSLog(@"Media Picker was cancelled");
//  [mediaPicker dismissModalViewControllerAnimated:YES];
//}
//
//- (void) displayMediaPicker{
//  
//  MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc]
//                                          initWithMediaTypes:MPMediaTypeAny];
//  
//  if (mediaPicker != nil){
//    
//    NSLog(@"Successfully instantiated a media picker.");
//    mediaPicker.delegate = self;
//    mediaPicker.allowsPickingMultipleItems = NO;
//    
//    [self.navigationController presentModalViewController:mediaPicker
//                                                 animated:YES];
//    
//  } else {
//    NSLog(@"Could not instantiate a media picker.");
//  }
//  
//}
//
//- (void)viewDidLoad {
//  [super viewDidLoad];
//  [self displayMediaPicker];
//}
//
//- (void) viewDidUnload{
//  [super viewDidUnload];
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation
//        :(UIInterfaceOrientation)interfaceOrientation{
//  return YES;
//}
//
//@end

/* 2 */
#import "Accessing_the_Music_LibraryViewController.h"

@implementation Accessing_the_Music_LibraryViewController

- (void) musicPlayerStateChanged:(NSNotification *)paramNotification{
  
  NSLog(@"Player State Changed");
  
  /* Let's get the state of the player */
  NSNumber *stateAsObject = 
  [paramNotification.userInfo 
   objectForKey:@"MPMusicPlayerControllerPlaybackStateKey"];
  
  NSInteger state = [stateAsObject integerValue];
  
  /* Make your decision based on the state of the player */
  switch (state){
    case MPMusicPlaybackStateStopped:{
      /* Here the media player has stopped playing the queue. */
      break;
    }
    case MPMusicPlaybackStatePlaying:{
      /* The media player is playing the queue. Perhaps you
       can reduce some processing that your application
       that is using to give more processing power
       to the media player */
      break;
    }
    case MPMusicPlaybackStatePaused:{
      /* The media playback is paused here. You might want
       to indicate by showing graphics to the user */
      break;
    }
    case MPMusicPlaybackStateInterrupted:{
      /* An interruption stopped the playback of the media queue */
      break;
    }
    case MPMusicPlaybackStateSeekingForward:{
      /* The user is seeking forward in the queue */
      break;
    }
    case MPMusicPlaybackStateSeekingBackward:{
      /* The user is seeking backward in the queue */
      break;
    }
  } /* switch (State){ */
  
}

- (void) nowPlayingItemIsChanged:(NSNotification *)paramNotification{
  
  NSLog(@"Playing Item Is Changed");
  
  NSString *persistentID = 
  [paramNotification.userInfo 
   objectForKey:@"MPMusicPlayerControllerNowPlayingItemPersistentIDKey"];
  
  /* Do something with Persistent ID */
  NSLog(@"Persistent ID = %@", persistentID);
  
}

- (void) volumeIsChanged:(NSNotification *)paramNotification{
  NSLog(@"Volume Is Changed");  
  /* The userInfo dictionary of this notification is normally empty */
}


- (void) mediaPicker:(MPMediaPickerController *)mediaPicker 
   didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
  
  NSLog(@"Media Picker returned");
  
  /* First, if we have already created a music player, let's
   deallocate it */
  self.myMusicPlayer = nil;
  
  self.myMusicPlayer = [[MPMusicPlayerController alloc] init];
  
  [self.myMusicPlayer beginGeneratingPlaybackNotifications];
  
  /* Get notified when the state of the playback changes */
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(musicPlayerStateChanged:)
   name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
   object:self.myMusicPlayer];
  
  /* Get notified when the playback moves from one item
   to the other. In this recipe, we are only going to allow
   our user to pick one music file */
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(nowPlayingItemIsChanged:)
   name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
   object:self.myMusicPlayer];
  
  /* And also get notified when the volume of the
   music player is changed */
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(volumeIsChanged:)
   name:MPMusicPlayerControllerVolumeDidChangeNotification
   object:self.myMusicPlayer];
  
  /* Start playing the items in the collection */
  [self.myMusicPlayer setQueueWithItemCollection:mediaItemCollection];
  [self.myMusicPlayer play];
  
  /* Finally dismiss the media picker controller */
  [mediaPicker dismissModalViewControllerAnimated:YES];
  
}

- (void) mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
  
  /* The media picker was cancelled */
  NSLog(@"Media Picker was cancelled");
  [mediaPicker dismissModalViewControllerAnimated:YES];
  
}

- (void) stopPlayingAudio{
  
  if (self.myMusicPlayer != nil){
    
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self
     name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
     object:self.myMusicPlayer];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
     object:self.myMusicPlayer];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMusicPlayerControllerVolumeDidChangeNotification
     object:self.myMusicPlayer];
    
    [self.myMusicPlayer stop];
  }
  
}

- (void) displayMediaPickerAndPlayItem{
  
  MPMediaPickerController *mediaPicker = 
  [[MPMediaPickerController alloc] 
   initWithMediaTypes:MPMediaTypeMusic];
  
  if (mediaPicker != nil){
    
    NSLog(@"Successfully instantiated a media picker.");
    mediaPicker.delegate = self;
    mediaPicker.allowsPickingMultipleItems = YES;
    
    [self.navigationController presentModalViewController:mediaPicker
                                                 animated:YES];
    
  } else {
    NSLog(@"Could not instantiate a media picker.");
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.buttonPickAndPlay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.buttonPickAndPlay.frame = CGRectMake(0.0f, 
                                            0.0f, 
                                            200, 
                                            37.0f);
  self.buttonPickAndPlay.center = CGPointMake(self.view.center.x,
                                              self.view.center.y - 50);
  [self.buttonPickAndPlay setTitle:@"Pick and Play"
                          forState:UIControlStateNormal];
  [self.buttonPickAndPlay addTarget:self
                             action:@selector(displayMediaPickerAndPlayItem)
                   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.buttonPickAndPlay];
  
  self.buttonStopPlaying = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.buttonStopPlaying.frame = CGRectMake(0.0f, 
                                            0.0f, 
                                            200, 
                                            37.0f);
  self.buttonStopPlaying.center = CGPointMake(self.view.center.x,
                                              self.view.center.y + 50);
  [self.buttonStopPlaying setTitle:@"Stop Playing"
                          forState:UIControlStateNormal];
  [self.buttonStopPlaying addTarget:self
                             action:@selector(stopPlayingAudio)
                   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.buttonStopPlaying];
  
  [self.navigationController setNavigationBarHidden:YES
                                           animated:NO];
}

- (void) viewDidUnload{
  [super viewDidUnload];
  
  [self stopPlayingAudio];
  self.myMusicPlayer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
