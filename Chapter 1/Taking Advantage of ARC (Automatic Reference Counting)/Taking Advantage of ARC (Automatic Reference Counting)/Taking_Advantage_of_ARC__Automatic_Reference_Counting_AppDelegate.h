//
//  Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate.h
//  Taking Advantage of ARC (Automatic Reference Counting)
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *myFirstName;
@property (weak, nonatomic) NSString *yourFirstName;

@end
