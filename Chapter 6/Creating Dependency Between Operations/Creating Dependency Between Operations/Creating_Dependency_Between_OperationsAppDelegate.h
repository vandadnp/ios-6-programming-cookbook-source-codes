//
//  Creating_Dependency_Between_OperationsAppDelegate.h
//  Creating Dependency Between Operations
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Creating_Dependency_Between_OperationsAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSInvocationOperation *firstOperation;
@property (nonatomic, strong) NSInvocationOperation *secondOperation;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end
