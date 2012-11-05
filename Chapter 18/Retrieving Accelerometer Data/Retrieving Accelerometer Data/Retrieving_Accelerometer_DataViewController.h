//
//  Retrieving_Accelerometer_DataViewController.h
//  Retrieving Accelerometer Data
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface Retrieving_Accelerometer_DataViewController : UIViewController

@property (nonatomic, strong) CMMotionManager *motionManager;

@end
