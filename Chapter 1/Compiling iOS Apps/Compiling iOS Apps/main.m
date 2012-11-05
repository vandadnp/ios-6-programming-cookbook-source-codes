//
//  main.m
//  Compiling iOS Apps
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Compiling_iOS_AppsAppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
      retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([Compiling_iOS_AppsAppDelegate class]));
  }
  return retVal;
}
