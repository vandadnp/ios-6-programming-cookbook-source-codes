//
//  CountingOperation.m
//  Operations
//
//  Created by Vandad Nahavandipoor on 10-08-29.
//  Copyright 2010  All rights reserved.
//

#import "CountingOperation.h"

@implementation CountingOperation

NSUInteger    startingCount;
NSUInteger    endingCount;
BOOL          finished;
BOOL          executing;

- (id) init {
  return([self initWithStartingCount:0
                         endingCount:1000]);
}

- (id) initWithStartingCount:(NSUInteger)paramStartingCount
                 endingCount:(NSUInteger)paramEndingCount{
  
  self = [super init];
  
  if (self != nil){

    /* Keep these values for the main method */
    startingCount = paramStartingCount;
    endingCount = paramEndingCount;
    
  }
  
  return(self);
  
}

- (void) start {
  
  /* If we are cancelled before starting, then
   we have to return immediately and generate the
   required KVO notifications */
  if ([self isCancelled]){
    /* If this operation *is* cancelled */
    /* KVO compliance */
    [self willChangeValueForKey:@"isFinished"];
    finished = YES;
    [self didChangeValueForKey:@"isFinished"];
    return;
    
  } else {
    /* If this operation is *not* cancelled */
    /* KVO compliance */
    [self willChangeValueForKey:@"isExecuting"];
    executing = YES;
    /* Call the main method from inside the start method */
    [self didChangeValueForKey:@"isExecuting"];
    [self main];
    
  }
  
}

- (void) main {
  
  @try {    
    /* Here is our autorelease pool */
    @autoreleasepool {
      /* Keep a local variable here that must get set to YES
       whenever we are done with the task */
      BOOL taskIsFinished = NO;
      
      /* Create a while loop here that only exists
       if the taskIsFinished variable is set to YES or
       the operation has been cancelled */
      while (taskIsFinished == NO &&
             [self isCancelled] == NO){
        
        /* Perform the task here */
        NSLog(@"Main Thread = %@", [NSThread mainThread]);
        NSLog(@"Current Thread = %@", [NSThread currentThread]);
        NSUInteger counter = startingCount;
        for (counter = startingCount;
             counter < endingCount;
             counter++){
          NSLog(@"Count = %lu", (unsigned long)counter);
        }
        /* Very important. This way we can get out of the
         loop and we are still complying with the cancellation
         rules of operations */
        taskIsFinished = YES;
        
      }
      
      /* KVO compliance. Generate the 
       required KVO notifications */
      [self willChangeValueForKey:@"isFinished"];
      [self willChangeValueForKey:@"isExecuting"];
      finished = YES;
      executing = NO;
      [self didChangeValueForKey:@"isFinished"];
      [self didChangeValueForKey:@"isExecuting"];
    }
  }
  @catch (NSException * e) {
    NSLog(@"Exception %@", e);
  }
  
}

- (BOOL)  isFinished{
  /* Simply return the value */
  return(finished);
}

- (BOOL)  isExecuting{
  /* Simply return the value */
  return(executing);
}

@end