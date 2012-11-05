//
//  PersonProtocol.h
//  Delegating Tasks with Protocols
//
//  Created by Vandad Nahavandipoor on 25/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <Foundation/Foundation.h>
//
//@protocol PersonProtocol <NSObject>
//
//@property (nonatomic, strong) NSString *firstName;
//@property (nonatomic, strong) NSString *lastName;
//@property (nonatomic, unsafe_unretained) NSUInteger age;
//
//@end

/* 2 */
#import <Foundation/Foundation.h>

@protocol PersonProtocol <NSObject>

@optional
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, unsafe_unretained) NSUInteger age;

@required
- (void) breathe;

@end
