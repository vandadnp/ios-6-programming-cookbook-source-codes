//
//  Presenting_Master_Detail_Views_with_UISplitViewControllerAppDelegate.h
//  Presenting Master-Detail Views with UISplitViewController
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface Presenting_Master_Detail_Views_with_UISplitViewControllerAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UISplitViewController *splitViewController;

@property (nonatomic, strong) 
  DetailViewController *detailViewController;

@end
