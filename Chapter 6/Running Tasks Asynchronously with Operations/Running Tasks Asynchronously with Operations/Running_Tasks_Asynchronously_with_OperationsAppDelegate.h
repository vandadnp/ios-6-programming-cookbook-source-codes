//
//  Running_Tasks_Asynchronously_with_OperationsAppDelegate.h
//  Running Tasks Asynchronously with Operations
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//
/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Running_Tasks_Asynchronously_with_OperationsAppDelegate
//           : UIResponder <UIApplicationDelegate>
//
//@property (nonatomic, strong) UIWindow *window;
//@property (nonatomic, strong) NSOperationQueue      *operationQueue;
//@property (nonatomic, strong) NSInvocationOperation *firstOperation;
//@property (nonatomic, strong) NSInvocationOperation *secondOperation;
//
//@end

/* 2 */
#import <UIKit/UIKit.h>

@class SimpleOperation;

@interface Running_Tasks_Asynchronously_with_OperationsAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSOperationQueue      *operationQueue;
@property (nonatomic, strong) SimpleOperation *firstOperation;
@property (nonatomic, strong) SimpleOperation *secondOperation;

@end
