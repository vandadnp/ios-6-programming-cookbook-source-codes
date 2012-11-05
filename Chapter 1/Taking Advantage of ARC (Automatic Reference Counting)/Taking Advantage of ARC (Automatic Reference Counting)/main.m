//
//  main.m
//  Taking Advantage of ARC (Automatic Reference Counting)
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
      retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([Taking_Advantage_of_ARC__Automatic_Reference_Counting_AppDelegate class]));
  }
  return retVal;
}
