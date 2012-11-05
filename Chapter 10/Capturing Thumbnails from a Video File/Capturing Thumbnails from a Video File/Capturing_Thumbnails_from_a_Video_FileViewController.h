//
//  Capturing_Thumbnails_from_a_Video_FileViewController.h
//  Capturing Thumbnails from a Video File
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface Capturing_Thumbnails_from_a_Video_FileViewController : UIViewController

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic, strong) UIButton *playButton;

@end