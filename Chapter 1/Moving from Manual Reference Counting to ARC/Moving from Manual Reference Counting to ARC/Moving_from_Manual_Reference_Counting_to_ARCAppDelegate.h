//
//  Moving_from_Manual_Reference_Counting_to_ARCAppDelegate.h
//  Moving from Manual Reference Counting to ARC
//
//  Created by Vandad Nahavandipoor on 25/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Moving_from_Manual_Reference_Counting_to_ARCAppDelegate 
//           : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//
//@property (nonatomic, strong) NSString *string1;
//@property (nonatomic, strong) NSString *string2;
//
//@end

/* 2 */
//#import <UIKit/UIKit.h>
//
//@interface Moving_from_Manual_Reference_Counting_to_ARCAppDelegate 
//           : UIResponder <UIApplicationDelegate>
//
//@property (strong, nonatomic) UIWindow *window;
//
//@property (nonatomic, strong) NSString *string1;
//@property (nonatomic, weak) NSString *string2;
//
//@end

/* 3 */
#import <UIKit/UIKit.h>

@interface Moving_from_Manual_Reference_Counting_to_ARCAppDelegate 
           : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) NSString *string1;
@property (nonatomic, unsafe_unretained) NSString *string2;

@end
