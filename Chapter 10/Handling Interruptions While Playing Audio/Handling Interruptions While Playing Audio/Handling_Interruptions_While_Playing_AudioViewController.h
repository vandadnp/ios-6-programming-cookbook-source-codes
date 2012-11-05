//
//  Handling_Interruptions_While_Playing_AudioViewController.h
//  Handling Interruptions While Playing Audio
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Handling_Interruptions_While_Playing_AudioViewController
           : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
