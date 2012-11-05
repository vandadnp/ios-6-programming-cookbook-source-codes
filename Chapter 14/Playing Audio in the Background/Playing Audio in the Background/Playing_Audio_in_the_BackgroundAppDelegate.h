//
//  Playing_Audio_in_the_BackgroundAppDelegate.h
//  Playing Audio in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Playing_Audio_in_the_BackgroundAppDelegate
           : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end
