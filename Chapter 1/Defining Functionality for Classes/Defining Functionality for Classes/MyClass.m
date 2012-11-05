//
//  MyClass.m
//  Defining Functionality for Classes
//
//  Created by Vandad Nahavandipoor on 29/10/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (id) allocAndInit{
  MyClass *result = [[MyClass alloc] init];
  return result;
}

@end
