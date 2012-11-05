//
//  main.m
//  Packaging iOS Apps For Distribution
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Packaging_iOS_Apps_For_DistributionAppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal = 0;
  @autoreleasepool {
      retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([Packaging_iOS_Apps_For_DistributionAppDelegate class]));
  }
  return retVal;
}
