//
//  Retrieving_Photos_and_Videos_from_the_Photo_LibraryAppDelegate.h
//  Retrieving Photos and Videos from the Photo Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Retrieving_Photos_and_Videos_from_the_Photo_LibraryViewController;

@interface Retrieving_Photos_and_Videos_from_the_Photo_LibraryAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Retrieving_Photos_and_Videos_from_the_Photo_LibraryViewController *viewController;

@property (nonatomic, strong) UINavigationController *navigationController;

@end
