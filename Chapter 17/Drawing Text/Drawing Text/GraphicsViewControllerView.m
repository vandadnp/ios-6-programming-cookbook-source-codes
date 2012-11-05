//
//  GraphicsViewControllerView.m
//  Drawing Text
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "GraphicsViewControllerView.h"
//
//@implementation GraphicsViewControllerView
//
//- (id)initWithFrame:(CGRect)frame{
//  self = [super initWithFrame:frame];
//  if (self) {
//    // Initialization code
//  }
//  return self;
//}
//
//- (void)drawRect:(CGRect)rect{
//  
//}
//
//@end

/* 2 */
#import "GraphicsViewControllerView.h"

@implementation GraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

- (void)drawRect:(CGRect)rect{
  
  UIFont *helveticaBold =  [UIFont fontWithName:@"HelveticaNeue-Bold"
                                           size:40.0f];
  
  NSString *myString = @"Some String";
  
  [myString drawAtPoint:CGPointMake(40, 180)
               withFont:helveticaBold];
  
}

@end
