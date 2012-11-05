//
//  Handling_Notifications_Delivered_to_a_Waking_AppViewController.m
//  Handling Notifications Delivered to a Waking App
//
//  Created by Vandad Nahavandipoor on 21/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Handling_Notifications_Delivered_to_a_Waking_AppViewController.h"

@implementation Handling_Notifications_Delivered_to_a_Waking_AppViewController

- (void) orientationChanged:(NSNotification *)paramNotification{
  NSLog(@"Orientation Changed");
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(orientationChanged:)
   name:UIDeviceOrientationDidChangeNotification
   object:nil];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
