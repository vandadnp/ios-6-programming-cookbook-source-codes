//
//  Person.m
//  Saving Objects to Files
//
//  Created by Vandad Nahavandipoor on 13/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "Person.h"

NSString *const kFirstNameKey = @"FirstNameKey";
NSString *const kLastNameKey = @"LastNameKey";

@implementation Person

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.firstName forKey:kFirstNameKey];
    [aCoder encodeObject:self.lastName forKey:kLastNameKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self != nil){
        _firstName = [aDecoder decodeObjectForKey:kFirstNameKey];
        _lastName = [aDecoder decodeObjectForKey:kLastNameKey];
    }
    return self;
}

@end
