//
//  Father.h
//  Delegating Tasks with Protocols
//
//  Created by Vandad Nahavandipoor on 25/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <Foundation/Foundation.h>
//#import "PersonProtocol.h"
//
//@interface Father : NSObject <PersonProtocol>
//
//@end

/* 2 */
#import <Foundation/Foundation.h>
#import "PersonProtocol.h"

@interface Father : NSObject <PersonProtocol>

- (void) breathe;

@end
