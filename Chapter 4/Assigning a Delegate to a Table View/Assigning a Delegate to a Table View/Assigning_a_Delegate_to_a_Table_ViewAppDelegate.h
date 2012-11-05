//
//  Assigning_a_Delegate_to_a_Table_ViewAppDelegate.h
//  Assigning a Delegate to a Table View
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Assigning_a_Delegate_to_a_Table_ViewViewController;

@interface Assigning_a_Delegate_to_a_Table_ViewAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Assigning_a_Delegate_to_a_Table_ViewViewController *viewController;

@end
