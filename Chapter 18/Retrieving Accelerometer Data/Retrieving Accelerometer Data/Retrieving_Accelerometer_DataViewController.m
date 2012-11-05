//
//  Retrieving_Accelerometer_DataViewController.m
//  Retrieving Accelerometer Data
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Retrieving_Accelerometer_DataViewController.h"

@implementation Retrieving_Accelerometer_DataViewController

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.motionManager = [[CMMotionManager alloc] init];
  
  if ([self.motionManager isAccelerometerAvailable]){
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [self.motionManager 
     startAccelerometerUpdatesToQueue:queue
     withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
       NSLog(@"X = %.04f, Y = %.04f, Z = %.04f",
             accelerometerData.acceleration.x,
             accelerometerData.acceleration.y,
             accelerometerData.acceleration.z);
     }];
  } else {
    NSLog(@"Accelerometer is not available.");
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
