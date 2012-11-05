//
//  MySingleton.m
//  Performing a Task at Most Once with GCD
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

- (id) sharedInstance{
  static MySingleton *SharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    SharedInstance = [MySingleton new];
  });
  return SharedInstance;
}

@end
