//
//  main.m
//  Determining if a Class is Available at Run Time
//
//  Created by Vandad Nahavandipoor on 08/08/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Determining_if_a_Class_is_Available_at_Run_TimeAppDelegate.h"

int main(int argc, char *argv[])
{
  @autoreleasepool {
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([Determining_if_a_Class_is_Available_at_Run_TimeAppDelegate class]));
  }
}
