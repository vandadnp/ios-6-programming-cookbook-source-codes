//
//  SomeOtherClass.m
//  Adding Properties to Classes
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "SomeOtherClass.h"
#import "Person.h"

@implementation SomeOtherClass

- (void) makeNewPerson{
    
Person *newPerson = [[Person alloc] init];
newPerson.firstName = @"Andrew";
NSLog(@"First name = %@", newPerson.firstName);
NSLog(@"First name = %@", [newPerson firstName]);
NSLog(@"Last name = %@", newPerson.lastName);
    
}

@end
