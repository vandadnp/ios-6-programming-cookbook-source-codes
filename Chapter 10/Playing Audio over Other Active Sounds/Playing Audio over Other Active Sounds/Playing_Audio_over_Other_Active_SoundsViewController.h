//
//  Playing_Audio_over_Other_Active_SoundsViewController.h
//  Playing Audio over Other Active Sounds
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Playing_Audio_over_Other_Active_SoundsViewController
           : UIViewController <AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
