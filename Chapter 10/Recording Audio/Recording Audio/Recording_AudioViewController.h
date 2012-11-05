//
//  Recording_AudioViewController.h
//  Recording Audio
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>

@interface Recording_AudioViewController : UIViewController 
           <AVAudioPlayerDelegate, AVAudioRecorderDelegate>

@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

- (NSString *)      audioRecordingPath;
- (NSDictionary *)  audioRecordingSettings;

@end
