//
//  Accessing_the_Music_LibraryAppDelegate.h
//  Accessing the Music Library
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Accessing_the_Music_LibraryViewController;

@interface Accessing_the_Music_LibraryAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Accessing_the_Music_LibraryViewController *viewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end
