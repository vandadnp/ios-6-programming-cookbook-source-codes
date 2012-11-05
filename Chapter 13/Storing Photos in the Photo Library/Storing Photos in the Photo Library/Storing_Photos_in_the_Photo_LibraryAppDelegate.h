//
//  Storing_Photos_in_the_Photo_LibraryAppDelegate.h
//  Storing Photos in the Photo Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Storing_Photos_in_the_Photo_LibraryViewController;

@interface Storing_Photos_in_the_Photo_LibraryAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Storing_Photos_in_the_Photo_LibraryViewController *viewController;
@property (nonatomic, strong) UINavigationController *navigationController;

@end
