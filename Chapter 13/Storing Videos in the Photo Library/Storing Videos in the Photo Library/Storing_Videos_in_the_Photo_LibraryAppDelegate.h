//
//  Storing_Videos_in_the_Photo_LibraryAppDelegate.h
//  Storing Videos in the Photo Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface Storing_Videos_in_the_Photo_LibraryAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end
