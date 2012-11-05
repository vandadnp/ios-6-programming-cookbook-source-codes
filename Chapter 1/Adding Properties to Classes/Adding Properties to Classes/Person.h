//
//  Person.h
//  Adding Properties to Classes
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong, readonly) NSString *lastName;

@end
