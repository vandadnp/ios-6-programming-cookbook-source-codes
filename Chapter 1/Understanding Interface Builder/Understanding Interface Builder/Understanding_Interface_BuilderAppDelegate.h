//
//  Understanding_Interface_BuilderAppDelegate.h
//  Understanding Interface Builder
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Understanding_Interface_BuilderViewController;

@interface Understanding_Interface_BuilderAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Understanding_Interface_BuilderViewController *viewController;

@end
