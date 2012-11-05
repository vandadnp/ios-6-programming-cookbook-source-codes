//
//  main.m
//  Running iOS Apps on the Simulator
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Running_iOS_Apps_on_the_SimulatorAppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
      retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([Running_iOS_Apps_on_the_SimulatorAppDelegate class]));
  }
  return retVal;
}
