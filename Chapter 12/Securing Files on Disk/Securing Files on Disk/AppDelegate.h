//
//  AppDelegate.h
//  Securing Files on Disk
//
//  Created by Vandad Nahavandipoor on 12/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSFileHandle *fileHandle;
@property (nonatomic) UIBackgroundTaskIdentifier backgroundTask;


@end
