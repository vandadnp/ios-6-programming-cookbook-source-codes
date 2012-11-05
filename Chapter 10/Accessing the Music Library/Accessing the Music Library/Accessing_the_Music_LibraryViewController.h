//
//  Accessing_the_Music_LibraryViewController.h
//  Accessing the Music Library
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//#import <MediaPlayer/MediaPlayer.h>
//
//@interface Accessing_the_Music_LibraryViewController
//           : UIViewController <MPMediaPickerControllerDelegate>
//
//@end

/* 2 */
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface Accessing_the_Music_LibraryViewController : UIViewController
           <MPMediaPickerControllerDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) MPMusicPlayerController *myMusicPlayer;
@property (nonatomic, strong) UIButton *buttonPickAndPlay;
@property (nonatomic, strong) UIButton *buttonStopPlaying;

@end
