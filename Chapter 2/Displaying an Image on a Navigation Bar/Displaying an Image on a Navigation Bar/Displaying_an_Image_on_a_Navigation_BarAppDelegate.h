//
//  Displaying_an_Image_on_a_Navigation_BarAppDelegate.h
//  Displaying an Image on a Navigation Bar
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Displaying_an_Image_on_a_Navigation_BarAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) RootViewController *rootViewController;

@end
