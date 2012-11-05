//
//  main.m
//  Creating a Simple iOS App in Xcode
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Creating_a_Simple_iOS_App_in_XcodeAppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
      retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([Creating_a_Simple_iOS_App_in_XcodeAppDelegate class]));
  }
  return retVal;
}
