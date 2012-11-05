//
//  MyWindow.m
//  Detecting Shakes on an iOS Device
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

- (void) motionEnded:(UIEventSubtype)motion 
           withEvent:(UIEvent *)event{
  
  if (motion == UIEventSubtypeMotionShake){
    NSLog(@"Detected a shake");
  }
  
}

@end
