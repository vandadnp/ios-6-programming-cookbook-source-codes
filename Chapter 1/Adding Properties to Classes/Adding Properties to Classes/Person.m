//
//  Person.m
//  Adding Properties to Classes
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) setFirstName:(NSString *)paramFirstName{
  _firstName = [paramFirstName stringByAppendingString:@" Jr"];
}

- (id)init
{
  self = [super init];
  if (self) {
    // Initialization code here.
    _lastName = @"Carnegie";
  }
  
  return self;
}

@end
