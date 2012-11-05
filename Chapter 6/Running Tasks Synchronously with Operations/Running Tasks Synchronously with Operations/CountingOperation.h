//
//  CountingOperation.h
//  Operations
//
//  Created by Vandad Nahavandipoor on 10-08-29.
//  Copyright 2010  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountingOperation : NSOperation
  
/* Designated Initializer */
- (id) initWithStartingCount:(NSUInteger)paramStartingCount
                 endingCount:(NSUInteger)paramEndingCount;

@end