//
//  Running_Tasks_Synchronously_with_OperationsAppDelegate.h
//  Running Tasks Synchronously with Operations
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Running_Tasks_Synchronously_with_OperationsAppDelegate
//           : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) NSInvocationOperation *simpleOperation;
//
//@end

/* 2 */
//#import <UIKit/UIKit.h>
//
//@interface Running_Tasks_Synchronously_with_OperationsAppDelegate
//           : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//@property (nonatomic, strong) NSBlockOperation *simpleOperation;
//
//@end

/* 3 */
#import <UIKit/UIKit.h>

@class CountingOperation;

@interface Running_Tasks_Synchronously_with_OperationsAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CountingOperation *simpleOperation;

@end
