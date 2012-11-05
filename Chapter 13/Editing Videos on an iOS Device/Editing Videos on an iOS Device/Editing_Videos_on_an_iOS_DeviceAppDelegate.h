//
//  Editing_Videos_on_an_iOS_DeviceAppDelegate.h
//  Editing Videos on an iOS Device
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Editing_Videos_on_an_iOS_DeviceViewController;

@interface Editing_Videos_on_an_iOS_DeviceAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Editing_Videos_on_an_iOS_DeviceViewController *viewController;

@property (nonatomic, strong) UINavigationController *navigationController;

@end
